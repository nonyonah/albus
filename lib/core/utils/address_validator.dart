import 'chain_constants.dart';

class AddressValidator {
  static bool isValidEVMAddress(String address) {
    return RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(address);
  }

  static bool isValidSolanaAddress(String address) {
    return RegExp(r'^[1-9A-HJ-NP-Za-km-z]{32,44}$').hasMatch(address);
  }

  static bool isValidAddress(String chain, String address) {
    switch (chain) {
      case ChainConstants.ethereum:
      case ChainConstants.base:
      case ChainConstants.optimism:
      case ChainConstants.bsc:
        return isValidEVMAddress(address);
      case ChainConstants.solana:
        return isValidSolanaAddress(address);
      default:
        return false;
    }
  }
}
