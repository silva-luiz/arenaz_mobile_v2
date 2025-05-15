import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GenericDrawer extends StatelessWidget {
  const GenericDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.tertiaryColor,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/arenaz_logo.png',
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Olá, PAPI!',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.defaultBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Início',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColors.defaultWhite,
                ),
              ),
              onTap: () => Modular.to.navigate('/home'),
              // onTap: () {},
            ),
            ListTile(
              title: const Text(
                'My favorites',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColors.defaultWhite,
                ),
              ),
              // onTap: () => Modular.to.navigate('/favorites'),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Perfil',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColors.defaultWhite,
                ),
              ),
              onTap: () => Modular.to.navigate('/profile'),
              // onTap: () {},
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                trailing: const Icon(
                  Icons.exit_to_app,
                  color: AppColors.danger,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: AppColors.danger,
                  ),
                ),
                onTap: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder:
                        (context) =>
                            const Center(child: CircularProgressIndicator()),
                  );

                  // try {
                  //   final authViewModel = Modular.get<AuthViewmodel>();
                  //   await authViewModel.signOut();

                  //   Navigator.of(context).pop();
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Logout successful!'),
                  //       backgroundColor: AppColors.success,
                  //     ),
                  //   );
                  //   Modular.to.navigate('/');
                  // } catch (e) {
                  //   Navigator.of(context).pop();

                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('Logout error: $e'),
                  //       backgroundColor: AppColors.primaryColor,
                  //     ),
                  //   );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
