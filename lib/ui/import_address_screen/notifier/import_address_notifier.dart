import 'package:albus/core/utils/validation_messages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:albus/services/balance_checker.dart'
    show BalanceChecker, balanceCheckerProvider;
import '../../../main.dart';
import '../../../services/storage_services.dart';
import 'import_address_state.dart';
import 'package:albus/services/storage_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final importAddressNotifier =
    StateNotifierProvider<ImportAddressNotifier, ImportAddressState>((ref) {
  // final chainNameResolver = ref.read(chainNameResolverProvider);
  final balanceChecker = ref.read(balanceCheckerProvider);
  final sharedPrefs = ref.read(sharedPreferencesProvider);
  final storageService =
      StorageService(ref.read(sharedPreferencesProvider).value!);
  return ImportAddressNotifier(
      ImportAddressState.initial(), balanceChecker, storageService);
});

class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  // final ChainNameResolver _nameResolver;
  final BalanceChecker _balanceChecker;
  final StorageService _storage;

  ImportAddressNotifier(
      ImportAddressState initialState, this._balanceChecker, this._storage)
      : super(initialState);

  Future<void> _validateAddress(String chain, String address) async {
    if (address.isEmpty) return;

    // Handle chain names on appropriate networks
    // if (ChainName.isValidName(address)) {
    //   state = state.copyWith(isLoading: true);
    //   final resolvedAddress = await _nameResolver.resolveName(address);
    //   state = state.copyWith(isLoading: false);

    //   if (resolvedAddress != null) {
    //     // Update the appropriate controller based on the chain
    //     final chainType = ChainName.parse(address).type;
    //     switch (chainType) {
    //       case ChainNameType.base:
    //         if (chain == ChainConstants.base) {
    //           state.addressControllers[chain]?.text = resolvedAddress;
    //         }
    //         break;
    //       case ChainNameType.ens:
    //         if (chain == ChainConstants.ethereum) {
    //           state.addressControllers[chain]?.text = resolvedAddress;
    //         }
    //         break;
    //       default:
    //       // Handle other chain types as needed
    //     }
    //     return;
    //   }
    // }

    // Continue with regular address validation...
    final validationMessage =
        ValidationMessages.getChainSpecificError(chain, address);
    final currentMessages = Map<String, String>.from(state.validationMessages);
    currentMessages[chain] = validationMessage;

    state = state.copyWith(
      validationMessages: currentMessages,
      error: validationMessage.isNotEmpty ? validationMessage : null,
    );
  }

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

  Future<bool> importAddress() async {
    if (state.nameController.text.isEmpty) {
      state = state.copyWith(error: 'Name is required');
      return false;
    }

    // Validate all addresses
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
      // Check balances before saving
      await checkBalances();

      // Save to storage
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
