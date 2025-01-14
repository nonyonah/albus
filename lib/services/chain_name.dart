// import 'package:web3dart/web3dart.dart';
// import 'package:http/http.dart' as http;

// enum ChainNameType {
//   ens, // .eth
//   base, // .base
// }

// class ChainName {
//   final String name;
//   final ChainNameType type;

//   const ChainName._(this.name, this.type);

//   factory ChainName.parse(String name) {
//     final normalized = name.trim().toLowerCase();

//     if (normalized.endsWith('.eth')) {
//       return ChainName._(normalized, ChainNameType.ens);
//     } else if (normalized.endsWith('.base')) {
//       return ChainName._(normalized, ChainNameType.base);
//     } else {
//       throw FormatException('Unsupported name format: $name');
//     }
//   }

//   static bool isValidName(String name) {
//     final normalized = name.trim().toLowerCase();
//     return normalized.endsWith('.eth') ||
//         normalized.endsWith('.base') ||
//         normalized.endsWith('.test');
//   }
// }

// class ChainNameResolver {
//   static const Map<ChainNameType, String> _registryAddresses = {
//     ChainNameType.ens:
//         '0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e', // Ethereum mainnet
//     ChainNameType.base:
//         '0x4A5b5aE1cC74871Deac9C7459e4eB4149990aE91', // Base mainnet
//   };

//   static const Map<ChainNameType, String> _resolverAddresses = {
//     ChainNameType.ens:
//         '0x4976fb03C32e5B8cfe2b6cCB31c09Ba78EBaBa41', // ENS Public Resolver
//     ChainNameType.base:
//         '0x4A5b5aE1cC74871Deac9C7459e4eB4149990aE91', // Base Resolver
//   };

//   final Map<ChainNameType, Web3Client> _clients;

//   ChainNameResolver({
//     required String ethereumRpcUrl,
//     required String baseRpcUrl,
//   }) : _clients = {
//           ChainNameType.ens: Web3Client(ethereumRpcUrl, http.Client()),
//           ChainNameType.base: Web3Client(baseRpcUrl, http.Client()),
//         };

//   Future<String?> resolveName(String nameStr) async {
//     try {
//       final chainName = ChainName.parse(nameStr);

//       // Get the appropriate client and resolver address
//       final client = _clients[chainName.type];
//       final resolverAddress = _resolverAddresses[chainName.type];

//       if (client == null || resolverAddress == null) {
//         throw UnsupportedError('Unsupported name type: ${chainName.type}');
//       }

//       // Basic resolver ABI - same for both ENS and Base names
//       const String resolverAbi = '''
//         [
//           {
//             "constant": true,
//             "inputs": [{"name": "node", "type": "bytes32"}],
//             "name": "addr",
//             "outputs": [{"name": "", "type": "address"}],
//             "payable": false,
//             "type": "function"
//           }
//         ]
//       ''';

//       final contract = DeployedContract(
//         ContractAbi.fromJson(resolverAbi, 'ChainNameResolver'),
//         EthereumAddress.fromHex(resolverAddress),
//       );

//       final nameHash = _generateNameHash(chainName.name);

//       final result = await client.call(
//         contract: contract,
//         function: contract.function('addr'),
//         params: [nameHash],
//       );

//       if (result.isEmpty || result[0] == null) {
//         return null;
//       }

//       final resolvedAddress = (result[0] as EthereumAddress).hex;

//       if (resolvedAddress == '0000000000000000000000000000000000000000') {
//         return null;
//       }

//       return '0x$resolvedAddress';
//     } catch (e) {
//       print('Chain name resolution error: $e');
//       return null;
//     }
//   }

//   List<int> _generateNameHash(String name) {
//     // This is a simplified namehash implementation
//     // For production use, consider using a proper namehash library
//     final bytes = List<int>.filled(32, 0);

//     // Split the name into labels
//     final labels = name.split('.');

//     // Hash each label
//     for (final label in labels.reversed) {
//       final labelBytes = label.codeUnits;

//       // XOR the bytes with the current hash
//       for (var i = 0; i < labelBytes.length; i++) {
//         bytes[i % 32] ^= labelBytes[i];
//       }
//     }

//     return bytes;
//   }

//   void dispose() {
//     for (final client in _clients.values) {
//       client.dispose();
//     }
//   }
// }
