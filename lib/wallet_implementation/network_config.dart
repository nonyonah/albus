// Network configurations
class NetworkConfig {
  final String rpcUrl;
  final int chainId;
  final String name;
  final String symbol;
  final String blockExplorer;

  const NetworkConfig({
    required this.rpcUrl,
    required this.chainId,
    required this.name,
    required this.symbol,
    required this.blockExplorer,
  });
}

final networks = {
  'base': const NetworkConfig(
    rpcUrl: 'https://sepolia.base.org',
    chainId: 84531,  // Base Goerli testnet
    name: 'Base Sepolia',
    symbol: 'ETH',
    blockExplorer: 'https://sepolia.basescan.org',
  ),
  'ethereum': const NetworkConfig(
    rpcUrl: 'https://goerli.infura.io/v3/YOUR_INFURA_ID',
    chainId: 5,  // Goerli testnet
    name: 'Goerli',
    symbol: 'ETH',
    blockExplorer: 'https://goerli.etherscan.io',
  ),
};