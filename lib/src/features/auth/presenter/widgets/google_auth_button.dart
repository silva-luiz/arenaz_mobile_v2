import '../../../shared/colors/colors.dart';
import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleAuthButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.defaultWhite,
          foregroundColor: AppColors.defaultBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: const BorderSide(color: AppColors.gray),
          ),
          elevation: 1,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/google-logo.png', height: 28),
            const SizedBox(width: 16),
            const Text(
              'Entrar com Google',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
