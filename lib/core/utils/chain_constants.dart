class ChainConstants {
  static const ethereum = 'ethereum';
  static const base = 'base';
  static const optimism = 'optimism';
  static const solana = 'solana';
  static const bsc = 'bsc';

  static const networkConfigs = {
    ethereum: NetworkConfig(
      name: 'Ethereum',
      chainId: 11155111,
      symbol: 'ETH',
      rpcUrl: 'https://sepolia.infura.io/v3/c06046673ac14658a6a8fd0f36a2fbcf',
    ),
    base: NetworkConfig(
      name: 'Base',
      chainId: 84532,
      symbol: 'ETH',
      rpcUrl: 'https://sepolia.base.org',
    ),
    optimism: NetworkConfig(
      name: 'Optimism',
      chainId: 11155420,
      symbol: 'ETH',
      rpcUrl: 'https://sepolia.optimism.io',
    ),
    // solana: NetworkConfig(
    //   name: 'Solana',
    //   symbol: 'SOL',
    //   rpcUrl: 'https://api.devnet.solana.com',
    // ),
    // bsc: NetworkConfig(
    //   name: 'Binance Smart Chain',
    //   chainId: 56,
    //   symbol: 'BNB',
    //   rpcUrl: 'https://data-seed-pre-1-s1.binance.org:8545',
    // ),
  };
}

class NetworkConfig {
  final String name;
  final int? chainId; // Null for Solana
  final String symbol;
  final String rpcUrl;

  const NetworkConfig({
    required this.name,
    this.chainId,
    required this.symbol,
    required this.rpcUrl,
  });
}
