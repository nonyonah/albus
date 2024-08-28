import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../themes/theme_helper.dart';

class CurrencyInputWidget extends StatefulWidget {
  final Function(double) onChanged;
  final List<String> currencySymbols;

  const CurrencyInputWidget({
    super.key,
    required this.onChanged,
    this.currencySymbols = const ['\$', '€', '£', '₦'], // Default currencies
  });

  @override
  _CurrencyInputWidgetState createState() => _CurrencyInputWidgetState();
}

class _CurrencyInputWidgetState extends State<CurrencyInputWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late NumberFormat _currencyFormat;
  String _selectedCurrencySymbol = '\$';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _currencyFormat = NumberFormat.currency(
      symbol: _selectedCurrencySymbol,
      decimalDigits: 0,
    );
    _controller.text = _currencyFormat.format(0);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: _selectedCurrencySymbol.length,
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

  void _onCurrencyChanged(String? newCurrency) {
    setState(() {
      _selectedCurrencySymbol = newCurrency!;
      _currencyFormat = NumberFormat.currency(
        symbol: _selectedCurrencySymbol,
        decimalDigits: 0,
      );
      _controller.text = _currencyFormat.format(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: _selectedCurrencySymbol,
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
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '${_selectedCurrencySymbol}0',
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\${_selectedCurrencySymbol}?\d+')),
          ],
          onChanged: (value) {
            String newValue = value.replaceAll(RegExp(r'[^\d]'), '');
            if (newValue.isEmpty) newValue = '0';
            double amount = double.parse(newValue);
            _controller.value = _controller.value.copyWith(
              text: _currencyFormat.format(amount),
              selection: TextSelection.collapsed(offset: _currencyFormat.format(amount).length),
            );
            widget.onChanged(amount);
          },
        ),
      ],
    );
  }
}
