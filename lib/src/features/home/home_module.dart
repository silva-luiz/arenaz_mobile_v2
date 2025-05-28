import 'package:flutter_modular/flutter_modular.dart';

import '../shared/shared_module.dart';
import 'home_binds.dart';
import 'home_routes.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => homeBinds(i);

  @override
  void routes(RouteManager r) => homeRoutes(r);
}
