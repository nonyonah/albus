// class ValidationMessages {
//   static String getChainSpecificError(String chain, String address) {
//     switch (chain) {
//       case ChainConstants.ethereum:
//       case ChainConstants.base:
//       case ChainConstants.optimism:
//         if (!address.startsWith('0x')) {
//           return 'Address must start with 0x';
//         }
//         if (address.length != 42) {
//           return 'EVM address must be 42 characters long';
//         }
//         if (!RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(address)) {
//           return 'Invalid EVM address format';
//         }
//         break;
//       case ChainConstants.solana:
//         if (!RegExp(r'^[1-9A-HJ-NP-Za-km-z]{32,44}$').hasMatch(address)) {
//           return 'Invalid Solana address format';
//         }
//         break;
//     }
//     return '';
//   }
// }
