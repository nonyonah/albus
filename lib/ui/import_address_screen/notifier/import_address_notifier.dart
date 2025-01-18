import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:albus/services/balance_checker.dart'
    show BalanceChecker, balanceCheckerProvider;
import '../../../main.dart';
import '../../../services/storage_services.dart';
import 'import_address_state.dart';
import 'package:albus/core/utils/validation_messages.dart';

// ImportAddressNotifier Provider
final importAddressNotifier =
    StateNotifierProvider<ImportAddressNotifier, ImportAddressState>((ref) {
  final balanceChecker = ref.read(balanceCheckerProvider);
  final sharedPreferencesAsync = ref.watch(sharedPreferencesProvider);
  // Handle the uninitialized or loading state
  if (sharedPreferencesAsync is AsyncLoading) {
    throw Exception('SharedPreferences is still loading');
  }
  if (sharedPreferencesAsync is AsyncError) {
    throw Exception('Failed to initialize SharedPreferences');
  }

  final storageService = StorageService(sharedPreferencesAsync.value!);

  return ImportAddressNotifier(
    ImportAddressState.initial(),
    balanceChecker,
    storageService,
  );
});

// Notifier Class
class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  final BalanceChecker _balanceChecker;
  final StorageService _storage;

  ImportAddressNotifier(
    ImportAddressState initialState,
    this._balanceChecker,
    this._storage,
  ) : super(initialState);

  // Validate Address
  Future<void> _validateAddress(String chain, String address) async {
    if (address.isEmpty) return;

    try {
      final validationMessage =
          ValidationMessages.getChainSpecificError(chain, address);
      final currentMessages =
          Map<String, String>.from(state.validationMessages);
      currentMessages[chain] = validationMessage;

      state = state.copyWith(
        validationMessages: currentMessages,
        error: validationMessage.isNotEmpty ? validationMessage : null,
      );
    } catch (e) {
      state = state.copyWith(error: 'Validation error: $e');
    }
  }

  // Check Balances
  Future<void> checkBalances() async {
    try {
      state = state.copyWith(isLoading: true);

      final addresses = <String, String>{};
      for (final entry in state.addressControllers.entries) {
        if (entry.value.text.isNotEmpty) {
          addresses[entry.key] = entry.value.text;
        }
      }

      final balances = await _balanceChecker.checkBalances(addresses);
      state = state.copyWith(
        balances: balances,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error checking balances: $e',
        isLoading: false,
      );
    }
  }

  // Import Address
  Future<bool> importAddress() async {
    if (state.nameController.text.isEmpty) {
      state = state.copyWith(error: 'Name is required');
      return false;
    }

    bool hasValidAddress = false;
    final addressData = <String, String>{};

    for (final entry in state.addressControllers.entries) {
      final address = entry.value.text;
      if (address.isNotEmpty) {
        final validationMessage =
            ValidationMessages.getChainSpecificError(entry.key, address);
        if (validationMessage.isNotEmpty) {
          state = state.copyWith(error: validationMessage);
          return false;
        }
        addressData[entry.key] = address;
        hasValidAddress = true;
      }
    }

    if (!hasValidAddress) {
      state = state.copyWith(error: 'At least one valid address is required');
      return false;
    }

    try {
      await checkBalances();

      await _storage.saveAddress({
        'name': state.nameController.text,
        'addresses': addressData,
        'balances': state.balances,
        'timestamp': DateTime.now().toIso8601String(),
      });

      return true;
    } catch (e) {
      state = state.copyWith(error: 'Failed to save address: $e');
      return false;
    }
  }
}
