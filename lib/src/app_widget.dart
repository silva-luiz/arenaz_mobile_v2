import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/shared/colors/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ArenaZ',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'ChakraPetch',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        ),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
