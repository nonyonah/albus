class ChainConstants {
  static const ethereum = 'ethereum';
  static const base = 'base';
  static const optimism = 'optimism';
  static const solana = 'solana';

  static const networkConfigs = {
    ethereum: NetworkConfig(
      name: 'Ethereum Sepolia',
      chainId: 11155111,
      symbol: 'ETH',
      rpcUrl: 'https://sepolia.infura.io/v3/YOUR_API_KEY',
    ),
    base: NetworkConfig(
      name: 'Base Sepolia',
      chainId: 84532,
      symbol: 'ETH',
      rpcUrl: 'https://sepolia.base.org',
    ),
    optimism: NetworkConfig(
      name: 'Optimism Sepolia',
      chainId: 11155420,
      symbol: 'ETH',
      rpcUrl: 'https://sepolia.optimism.io',
    ),
    solana: NetworkConfig(
      name: 'Solana Devnet',
      symbol: 'SOL',
      rpcUrl: 'https://api.devnet.solana.com',
    ),
  };
}

class NetworkConfig {
  final String name;
  final int? chainId;  // Null for Solana
  final String symbol;
  final String rpcUrl;

  const NetworkConfig({
    required this.name,
    this.chainId,
    required this.symbol,
    required this.rpcUrl,
  });
}
