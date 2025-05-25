import 'package:arenaz_mobile_v2/src/features/establishment_details/establishment_details_binds.dart';
import 'package:arenaz_mobile_v2/src/features/establishment_details/establishment_details_routes.dart';
import 'package:arenaz_mobile_v2/src/features/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EstablishmentInfoModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) => establishmentInfoBinds(i);

  @override
  void routes(RouteManager r) => establishmentInfoRoutes(r);
}
