import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class GenericButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color backgroundColor;

  const GenericButton({
    super.key,
    required this.label,
    this.textColor = AppColors.defaultBlack,
    this.backgroundColor = AppColors.primaryColor,
    this.onPressed,
  });

  const GenericButton.primary({
    super.key,
    required this.label,
    this.textColor = AppColors.defaultBlack,
    this.backgroundColor = AppColors.primaryColor,
    this.onPressed,
  });

  const GenericButton.secondary({
    super.key,
    required this.label,
    this.textColor = AppColors.defaultWhite,
    this.backgroundColor = AppColors.secondaryColor,
    this.onPressed,
  });

  const GenericButton.tertiary({
    super.key,
    required this.label,
    this.textColor = AppColors.defaultWhite,
    this.backgroundColor = AppColors.tertiaryColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(textColor),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          ),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
