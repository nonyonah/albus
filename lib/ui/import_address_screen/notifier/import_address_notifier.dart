import 'package:albus/core/utils/validation_messages.dart';
import 'package:albus/services/chain_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:albus/services/balance_checker.dart'
    show BalanceChecker, balanceCheckerProvider;
import '../../../core/utils/chain_constants.dart';
import '../../../main.dart';
import 'import_address_state.dart';

final importAddressNotifier =
    StateNotifierProvider<ImportAddressNotifier, ImportAddressState>((ref) {
  final chainNameResolver = ref.read(chainNameResolverProvider);
  final balanceChecker = ref.read(balanceCheckerProvider);
  return ImportAddressNotifier(ImportAddressState.initial(),
      chainNameResolver as ChainNameResolver, balanceChecker);
});

class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  final ChainNameResolver _nameResolver;
  final BalanceChecker _balanceChecker;

  ImportAddressNotifier(
      ImportAddressState initialState, this._nameResolver, this._balanceChecker)
      : super(initialState);

  Future<void> _validateAddress(String chain, String address) async {
    if (address.isEmpty) return;

    // Handle chain names on appropriate networks
    if (ChainName.isValidName(address)) {
      state = state.copyWith(isLoading: true);
      final resolvedAddress = await _nameResolver.resolveName(address);
      state = state.copyWith(isLoading: false);

      if (resolvedAddress != null) {
        // Update the appropriate controller based on the chain
        final chainType = ChainName.parse(address).type;
        switch (chainType) {
          case ChainNameType.base:
            if (chain == ChainConstants.base) {
              state.addressControllers[chain]?.text = resolvedAddress;
            }
            break;
          case ChainNameType.ens:
            if (chain == ChainConstants.ethereum) {
              state.addressControllers[chain]?.text = resolvedAddress;
            }
            break;
          default:
          // Handle other chain types as needed
        }
        return;
      }
    }

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
}
