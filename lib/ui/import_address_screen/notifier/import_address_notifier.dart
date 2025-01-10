import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/chain_constants.dart';
import '../../../core/utils/validation_messages.dart';
import '../../../services/storage_services.dart';
import 'import_address_state.dart';

class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  final StorageService _storage;
  final ENSService _ensService;
  final BalanceChecker _balanceChecker;

  ImportAddressNotifier(
    ImportAddressState state,
    this._storage,
    this._ensService,
    this._balanceChecker,
  ) : super(state) {
    _setupListeners();
  }

  Future<void> _validateAddress(String chain, String address) async {
    if (address.isEmpty) return;

    // Handle ENS names for Ethereum
    if (chain == ChainConstants.ethereum && address.endsWith('.eth')) {
      state = state.copyWith(isLoading: true);
      final resolvedAddress = await _ensService.resolveENS(address);
      state = state.copyWith(isLoading: false);

      if (resolvedAddress != null) {
        state.addressControllers[chain]?.text = resolvedAddress;
        return;
      }
    }

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
