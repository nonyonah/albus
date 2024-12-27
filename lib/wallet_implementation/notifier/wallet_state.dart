// class WalletState {
//   final bool isLoading;
//   final Map<String, String>? addresses;
//   final String? error;
//   final Map<String, double> balances;
//   final String? selectedNetwork;

//   WalletState({
//     this.isLoading = false,
//     this.addresses,
//     this.error,
//     this.balances = const {},
//     this.selectedNetwork = 'base',
//   });

//   WalletState copyWith({
//     bool? isLoading,
//     Map<String, String>? addresses,
//     String? error,
//     Map<String, double>? balances,
//     String? selectedNetwork,
//   }) {
//     return WalletState(
//       isLoading: isLoading ?? this.isLoading,
//       addresses: addresses ?? this.addresses,
//       error: error,
//       balances: balances ?? this.balances,
//       selectedNetwork: selectedNetwork ?? this.selectedNetwork,
//     );
//   }
// }