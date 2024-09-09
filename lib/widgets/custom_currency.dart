import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../themes/theme_helper.dart';

// State providers
final selectedCurrencyProvider = StateProvider<String>((ref) => '\$');
final amountProvider = StateProvider<double>((ref) => 0);

class CurrencyInputWidget extends ConsumerStatefulWidget {
  final List<String> currencySymbols;

  const CurrencyInputWidget({
    super.key,
    this.currencySymbols = const ['\$', '€', '£', '₦'],
    required Null Function(dynamic value) onChanged,
  });

  @override
  ConsumerState<CurrencyInputWidget> createState() =>
      _CurrencyInputWidgetState();
}

class _CurrencyInputWidgetState extends ConsumerState<CurrencyInputWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late NumberFormat _currencyFormat;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _updateCurrencyFormat();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: ref.read(selectedCurrencyProvider).length,
          extentOffset: _controller.text.length,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateCurrencyFormat() {
    _currencyFormat = NumberFormat.currency(
      symbol: ref.read(selectedCurrencyProvider),
      decimalDigits: 0,
    );
    _controller.text = '${ref.read(selectedCurrencyProvider)}0';
  }

  void _onCurrencyChanged(String? newCurrency) {
    if (newCurrency != null) {
      ref.read(selectedCurrencyProvider.notifier).state = newCurrency;
      _updateCurrencyFormat();
      _controller.text =
          newCurrency + _controller.text.replaceAll(RegExp(r'[^\d]'), '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: selectedCurrency,
          items: widget.currencySymbols
              .map((symbol) => DropdownMenuItem(
                    value: symbol,
                    child: Text(symbol),
                  ))
              .toList(),
          onChanged: _onCurrencyChanged,
        ),
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: theme.textTheme.displayLarge,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'\d+')),
          ],
          onChanged: (value) {
            String newValue = value.replaceAll(RegExp(r'[^\d]'), '');
            if (newValue.isEmpty) newValue = '0';
            double amount = double.parse(newValue);

            String formattedValue = selectedCurrency +
                _currencyFormat.format(amount).replaceAll(selectedCurrency, '');
            _controller.value = TextEditingValue(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );

            ref.read(amountProvider.notifier).state = amount;
          },
        ),
      ],
    );
  }
}
