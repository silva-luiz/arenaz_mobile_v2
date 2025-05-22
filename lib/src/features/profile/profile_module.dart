import 'package:arenaz_mobile_v2/src/features/profile/profile_binds.dart';
import 'package:arenaz_mobile_v2/src/features/profile/profile_routes.dart';
import 'package:arenaz_mobile_v2/src/features/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module{
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => profileBinds(i);

  @override
  void routes(RouteManager r) => profileRoutes(r);
}