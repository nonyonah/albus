import '../../../core/utils/chain_constants.dart';
import '../../../core/utils/validation_messages.dart';
import '../../../services/storage_services.dart';
import 'import_address_state.dart';

class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  final StorageService _storage;

  ImportAddressNotifier(
    ImportAddressState state,
    this._storage,
  ) : super(state) {
    _setupListeners();
  }

  void _setupListeners() {
    for (final entry in state.addressControllers.entries) {
      entry.value.addListener(() {
        _validateAddress(entry.key, entry.value.text);
      });
    }
  }

  Future<void> _validateAddress(String chain, String address) async {
    if (address.isEmpty) return;

    final validationMessage =
        ValidationMessages.getChainSpecificError(chain, address);
    final currentMessages = Map<String, String>.from(state.validationMessages);
    currentMessages[chain] = validationMessage;

    state = state.copyWith(
      validationMessages: currentMessages,
      error: validationMessage.isNotEmpty ? validationMessage : null,
    );
  }

  bool validateForm() {
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
      state = state.copyWith(error: 'At least one address is required');
      return false;
    }

    try {
      _storage.saveAddress({
        'name': state.nameController.text,
        'addresses': addressData,
        'timestamp': DateTime.now().toIso8601String(),
      });

      return true;
    } catch (e) {
      state = state.copyWith(error: 'Failed to save address: $e');
      return false;
    }
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
