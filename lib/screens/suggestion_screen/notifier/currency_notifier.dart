import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/currency_item_model.dart';
import 'currency_state.dart';

class CurrencyNotifier extends StateNotifier<CurrencyState> {
  CurrencyNotifier() : super(CurrencyState(
    selectedCurrency: CurrencyItemModel(amountCard: "USD", id: "usd"),
    currencies: [
      CurrencyItemModel(amountCard: "USD", id: "usd"),
      CurrencyItemModel(amountCard: "NGN", id: "ngn"),
      CurrencyItemModel(amountCard: "EUR", id: "eur"),
      CurrencyItemModel(amountCard: "GBP", id: "gbp"),
      CurrencyItemModel(amountCard: "KES", id: "kes"),
    ],
    currencySymbols: {
      'USD': '\$',
      'NGN': '₦',
      'EUR': '€',
      'GBP': '£',
      'KES': 'KSh',
    }
  ));

  void selectCurrency(CurrencyItemModel currency) {
    state = CurrencyState(
      selectedCurrency: currency,
      currencies: state.currencies,
      currencySymbols: state.currencySymbols,
    );
  }

  void addCurrency(CurrencyItemModel currency, String symbol) {
    if (!state.currencies.any((c) => c.amountCard == currency.amountCard)) {
      final newCurrencies = List<CurrencyItemModel>.from(state.currencies)..add(currency);
      final newSymbols = Map<String, String>.from(state.currencySymbols)..[currency.amountCard!] = symbol;
      state = CurrencyState(
        selectedCurrency: state.selectedCurrency,
        currencies: newCurrencies,
        currencySymbols: newSymbols,
      );
    }
  }
}

final currencyProvider = StateNotifierProvider<CurrencyNotifier, CurrencyState>((ref) {
  return CurrencyNotifier();
});