import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
final void Function()? onTap;

  const AvatarWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
                        child: Icon(Icons.camera_alt, size: 18, color: AppColors.defaultBlack),
                      ),
                    ),
                  ),
                ],
              );
  }
}