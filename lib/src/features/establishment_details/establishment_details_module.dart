import 'package:flutter_modular/flutter_modular.dart';

import '../shared/shared_module.dart';
import 'establishment_details_binds.dart';
import 'establishment_details_routes.dart';

class EstablishmentInfoModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => establishmentInfoBinds(i);

  @override
  void routes(RouteManager r) => establishmentInfoRoutes(r);
}
