import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Constants.getStandardColor(context),
          minimumSize: const Size(150, 50),
        ),
        child: Text(
          'Calcular',
          style: TextStyle(
            color: Constants.getTextColor(context),
          ),
        ),
      ),
    );
  }
}
