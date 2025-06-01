import 'package:flutter_modular/flutter_modular.dart';

import '../shared/shared_module.dart';
import 'register_binds.dart';
import 'reigster_routes.dart';

class RegisterModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => registerBinds(i);

  @override
  void routes(RouteManager r) => registerRoutes(r);
}
