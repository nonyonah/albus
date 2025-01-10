import 'package:flutter/foundation.dart';

@immutable
class NetworkConfig {
  final String name;
  final String rpcUrl;
  final String symbol;
  final String explorer;
  final int? chainId;

  const NetworkConfig({
    required this.name,
    required this.rpcUrl,
    required this.symbol,
    required this.explorer,
    this.chainId,
  });
}
