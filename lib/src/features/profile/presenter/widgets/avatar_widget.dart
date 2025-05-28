import 'package:flutter/material.dart';

import '../../../shared/colors/colors.dart';

class AvatarWidget extends StatelessWidget {
  final String userName;
  final String userEmail;
  final void Function()? onTap;

  const AvatarWidget({
    super.key,
    this.onTap,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              radius: 60,
              child: Image.asset('assets/images/arenaz_logo.png'),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: GestureDetector(
                onTap: onTap,
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: AppColors.defaultBlack,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(
          userName,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          userEmail,
          style: TextStyle(fontSize: 16, color: AppColors.textColor),
        ),
      ],
    );
  }
}
