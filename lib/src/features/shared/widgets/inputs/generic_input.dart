import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/colors.dart';

class GenericInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? label;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const GenericInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.defaultWhite,
            floatingLabelStyle: const TextStyle(
              color: AppColors.defaultBlack,
              fontWeight: FontWeight.w500,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.danger, width: 2.5),
            ),
            errorStyle: const TextStyle(color: AppColors.danger, fontSize: 14),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.gray, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2.5,
              ),
            ),
            suffixIcon: suffixIcon,
            labelText: label,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
