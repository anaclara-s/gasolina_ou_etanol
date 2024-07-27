import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            cursorColor: Constants.getStandardColor(context),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: Constants.getStandardColor(context),
              ),
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.getStandardColor(context),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.getStandardColor(context),
                ),
              ),
            ),
            textAlign: TextAlign.start,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(),
            ],
          ),
        ),
      ],
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    double value = double.parse(digitsOnly) / 100;

    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    String newText = formatter.format(value);

    int newSelectionIndex = newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}
