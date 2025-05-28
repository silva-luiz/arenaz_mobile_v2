import 'profile_binds.dart';
import 'profile_routes.dart';
import '../shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module{
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => profileBinds(i);

  @override
  void routes(RouteManager r) => profileRoutes(r);
}