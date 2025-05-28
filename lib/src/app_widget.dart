import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ArenaZ',
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'ChakraPetch'),
      routerConfig: Modular.routerConfig,
    );
  }
}
