import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:solana/solana.dart';
import '../core/utils/chain_constants.dart';

class BalanceChecker {
  final Map<String, Web3Client> _evmClients;
  final SolanaClient _solanaClient;

  BalanceChecker(this._evmClients, this._solanaClient);

  Future<Map<String, double>> checkBalances(
      Map<String, String> addresses) async {
    final Map<String, double> balances = {};

    for (final entry in addresses.entries) {
      try {
        if (entry.key == ChainConstants.solana) {
          final balance = await _solanaClient.rpcClient.getBalance(entry.value);
          balances[entry.key] = balance.value / 1e9;
        } else {
          final client = _evmClients[entry.key];
          if (client != null) {
            final balance = await client.getBalance(
              EthereumAddress.fromHex(entry.value),
            );
            balances[entry.key] = balance.getValueInUnit(EtherUnit.ether);
          }
        }
      } catch (e) {
        print('Error checking balance for ${entry.key}: $e');
        balances[entry.key] = 0;
      }
    }

    return balances;
  }
}

final balanceCheckerProvider = Provider<BalanceChecker>((ref) {
  final evmClients = {
    ChainConstants.base: Web3Client('https://base.publicnode.com', Client()),
    ChainConstants.ethereum:
        Web3Client('https://mainnet.infura.io/v3/YOUR_PROJECT_ID', Client()),
    // Add other EVM chain clients as needed
  };

  final solanaClient = SolanaClient(
    rpcUrl: Uri.parse('https://api.mainnet-beta.solana.com'),
    websocketUrl: Uri.parse('wss://api.mainnet-beta.solana.com'),
  );

  return BalanceChecker(evmClients, solanaClient);
});
