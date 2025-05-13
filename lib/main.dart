import 'package:arenaz_mobile_v2/src/app_module.dart';
import 'package:arenaz_mobile_v2/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
