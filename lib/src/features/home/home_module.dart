import 'package:arenaz_mobile_v2/src/features/home/home_binds.dart';
import 'package:arenaz_mobile_v2/src/features/home/home_routes.dart';
import 'package:arenaz_mobile_v2/src/features/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => homeBinds(i);

  @override
  void routes(RouteManager r) => homeRoutes(r);
}
