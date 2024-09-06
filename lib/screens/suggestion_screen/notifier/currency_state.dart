import 'package:albus/screens/suggestion_screen/models/currency_item_model.dart';

class CurrencyState {
  final CurrencyItemModel selectedCurrency;
  final List<CurrencyItemModel> currencies;
  final Map<String, String> currencySymbols;

  CurrencyState({
    required this.selectedCurrency,
    required this.currencies,
    required this.currencySymbols,
  });
}