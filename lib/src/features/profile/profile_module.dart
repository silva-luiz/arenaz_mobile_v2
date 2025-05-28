import 'package:flutter_modular/flutter_modular.dart';

import '../shared/shared_module.dart';
import 'profile_binds.dart';
import 'profile_routes.dart';

class ProfileModule extends Module{
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => profileBinds(i);

  @override
  void routes(RouteManager r) => profileRoutes(r);
}