import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/address_validator.dart';
import '../model/import_address_model.dart';
import 'import_address_state.dart';

final importAddressNotifier = StateNotifierProvider.autoDispose<
    ImportAddressNotifier, ImportAddressState>(
  (ref) => ImportAddressNotifier(ImportAddressState.initial()),
);

class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  ImportAddressNotifier(ImportAddressState state) : super(state) {
    _setupListeners();
  }

  void _setupListeners() {
    for (final entry in state.addressControllers.entries) {
      entry.value.addListener(() {
        _validateAddress(entry.key, entry.value.text);
      });
    }
  }

  void _validateAddress(String chain, String address) {
    if (address.isEmpty) return;

    final isValid = AddressValidator.isValidAddress(chain, address);
    final currentValidations = 
        state.importAddressModelObj?.chainValidations ?? {};
    
    final updatedModel = ImportAddressModel(
      chainValidations: {
        ...currentValidations,
        chain: isValid,
      },
    );

    state = state.copyWith(
      importAddressModelObj: updatedModel,
      error: isValid ? null : 'Invalid $chain address',
    );
  }

  void updateName(String name) {
    state.nameController.text = name;
  }

  void updateAddress(String chain, String address) {
    final controller = state.addressControllers[chain];
    if (controller != null) {
      controller.text = address;
      _validateAddress(chain, address);
    }
  }

  Future<bool> importAddress() async {
    final name = state.nameController.text;
    if (name.isEmpty) {
      state = state.copyWith(error: 'Name is required');
      return false;
    }

    // Check if at least one valid address is provided
    bool hasValidAddress = false;
    for (final entry in state.addressControllers.entries) {
      final address = entry.value.text;
      if (address.isNotEmpty) {
        if (!AddressValidator.isValidAddress(entry.key, address)) {
          state = state.copyWith(error: 'Invalid ${entry.key} address');
          return false;
        }
        hasValidAddress = true;
      }
    }

    if (!hasValidAddress) {
      state = state.copyWith(error: 'At least one valid address is required');
      return false;
    }

    // If all validations pass, create the address data
    final addresses = <String, String>{};
    for (final entry in state.addressControllers.entries) {
      if (entry.value.text.isNotEmpty) {
        addresses[entry.key] = entry.value.text;
      }
    }

    // TODO: Handle the successful import (e.g., save to storage, update global state)
    return true;
  }

  @override
  void dispose() {
    state.nameController.dispose();
    for (final controller in state.addressControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
