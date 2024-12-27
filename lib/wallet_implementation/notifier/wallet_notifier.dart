// import 'package:albus/wallet_implementation/notifier/wallet_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:web3dart/web3dart.dart';
// import '../network_config.dart';
// import 'package:bip39/bip39.dart' as bip39;
// import 'package:ed25519_hd_key/ed25519_hd_key.dart';
// import 'package:hex/hex.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart';

// final walletProvider = StateNotifierProvider<WalletNotifier, WalletState>((ref) {
//   return WalletNotifier();
// });

// class WalletNotifier extends StateNotifier<WalletState> {
//   WalletNotifier() : super(WalletState());
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();

//   Web3Client? _web3Client;

//   Future<void> setNetwork(String network) async {
//     if (!networks.containsKey(network)) return;

//     state = state.copyWith(selectedNetwork: network);

//     final rpcUrl = networks[network]?.rpcUrl;
//     if (rpcUrl != null) {
//       _web3Client = Web3Client(rpcUrl, Client());
//     }

//     if (state.addresses != null) {
//       await _updateBalances(state.addresses![network]!);
//     }
//   }

//   Future<void> importWallet(String seedPhrase) async {
//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       if (!bip39.validateMnemonic(seedPhrase)) {
//         throw Exception('Invalid seed phrase');
//       }

//       final seed = bip39.mnemonicToSeed(seedPhrase);
//       final addresses = await _generateAddresses(seed);

//       await _storage.write(
//         key: 'encrypted_seed',
//         value: seedPhrase, // Encrypt in production
//       );

//       state = state.copyWith(
//         isLoading: false,
//         addresses: addresses,
//       );

//       if (state.selectedNetwork != null) {
//         await _updateBalances(addresses[state.selectedNetwork!]!);
//       }
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         error: e.toString(),
//       );
//     }
//   }

//   Future<Map<String, String>> _generateAddresses(List<int> seed) async {
//     final masterKey = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
//     final privateKey = HEX.encode(masterKey.key);
//     final credentials = EthPrivateKey.fromHex(privateKey);
//     final address = credentials.address.hex;

//     return networks.map((key, _) => MapEntry(key, address));
//   }

//   Future<void> _updateBalances(String address) async {
//     if (_web3Client == null || state.selectedNetwork == null) return;

//     try {
//       final balance = await _web3Client!
//           .getBalance(EthereumAddress.fromHex(address));

//       state = state.copyWith(
//         balances: {
//           ...state.balances,
//           state.selectedNetwork!: balance.getValueInUnit(EtherUnit.ether),
//         },
//       );
//     } catch (e) {
//       state = state.copyWith(
//         error: 'Error fetching balance: $e',
//       );
//     }
//   }

//   Future<String?> sendTransaction({
//     required String to,
//     required double amount,
//   }) async {
//     if (_web3Client == null || state.selectedNetwork == null) return null;

//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       final seedPhrase = await _storage.read(key: 'encrypted_seed');
//       if (seedPhrase == null) throw Exception('No wallet found');

//       final credentials = await _getCredentials(seedPhrase);

//       if (!EthereumAddress.fromHex(to).isValidEthereumAddress) {
//         throw Exception('Invalid recipient address');
//       }

//       final transaction = await _web3Client!.sendTransaction(
//         credentials,
//         Transaction(
//           to: EthereumAddress.fromHex(to),
//           value: EtherAmount.fromUnitAndValue(
//             EtherUnit.ether,
//             (amount * 1e18).toInt(),
//           ),
//         ),
//         chainId: networks[state.selectedNetwork!]!.chainId,
//       );

//       await _updateBalances(credentials.address.hex);
//       state = state.copyWith(isLoading: false);

//       return transaction;
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         error: e.toString(),
//       );
//       return null;
//     }
//   }

//   Future<Credentials> _getCredentials(String seedPhrase) async {
//     final seed = bip39.mnemonicToSeed(seedPhrase);
//     final masterKey = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
//     final privateKey = HEX.encode(masterKey.key);
//     return EthPrivateKey.fromHex(privateKey);
//   }
// }

// extension on EthereumAddress {
//   bool get isValidEthereumAddress {
//     return RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(hex);
//   }
// }
