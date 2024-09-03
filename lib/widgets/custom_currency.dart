import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../themes/theme_helper.dart';

class CurrencyInputWidget extends StatefulWidget {
  final Function(double) onChanged;
  final String currencySymbol;

  const CurrencyInputWidget({
    super.key,
    required this.onChanged,
    this.currencySymbol = '\$', // Default currency symbol
  });

  @override
  _CurrencyInputWidgetState createState() => _CurrencyInputWidgetState();
}

class _CurrencyInputWidgetState extends State<CurrencyInputWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late NumberFormat _currencyFormat;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _currencyFormat = NumberFormat.currency(
      symbol: widget.currencySymbol,
      decimalDigits: 0,
    );
    _controller.text =
        '${widget.currencySymbol}0'; // Display the currency symbol initially

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: widget.currencySymbol.length,
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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: theme.textTheme.displayLarge,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'\d+'), // Allow only digits
        ),
      ],
      onChanged: (value) {
        // Remove the currency symbol and format the number
        String newValue = value.replaceAll(RegExp(r'[^\d]'), '');
        if (newValue.isEmpty) newValue = '0';
        double amount = double.parse(newValue);

        // Update the text controller with the formatted currency
        String formattedValue = widget.currencySymbol +
            _currencyFormat
                .format(amount)
                .replaceAll(widget.currencySymbol, '');
        _controller.value = TextEditingValue(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );

        // Call the onChanged callback
        widget.onChanged(amount);
      },
    );
  }
}
