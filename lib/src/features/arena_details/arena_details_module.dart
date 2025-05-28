import 'arena_details_binds.dart';
import 'arena_details_routes.dart';
import '../shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ArenaDetailsModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => arenaDetailsBinds(i);

  @override
  void routes(RouteManager r) => arenaDetailsRoutes(r);
}
