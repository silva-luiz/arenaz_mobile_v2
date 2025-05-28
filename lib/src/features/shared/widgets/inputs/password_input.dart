import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;


  const PasswordInput({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          keyboardType: TextInputType.text,
          obscureText: _obscureText,
          validator: widget.validator,
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
            labelText: widget.label,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
