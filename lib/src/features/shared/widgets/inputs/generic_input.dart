import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/colors.dart';

class GenericInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final String? label;
  final bool isEnabled;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool autofocus;

  const GenericInput({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.label,
    this.validator,
    this.isEnabled = true,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          focusNode: focusNode,
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction,
          autofocus: autofocus,
          enabled: isEnabled,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: isEnabled ? AppColors.defaultWhite : AppColors.gray.withValues(),
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: AppColors.gray.withValues(),
                width: 1.5,
              ),
            ),
            suffixIcon: suffixIcon,
            labelText: label,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.gray.withValues(),
            ),
          ),
        ),
      ),
    );
  }
}