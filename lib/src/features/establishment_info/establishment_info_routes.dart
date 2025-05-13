import 'package:arenaz_mobile_v2/src/features/establishment_info/presenter/pages/establishment_info_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum EstablishmentInfoRouteNamed { establishmentInfo }

extension EstablishmentInfoRouteNamedExtension on EstablishmentInfoRouteNamed {
  String get _path {
    switch (this) {
      case EstablishmentInfoRouteNamed.establishmentInfo:
        return '/:id';
      default:
        return '/';
    }
  }
}

void establishmentInfoRoutes(RouteManager r) {
  r.child(
    EstablishmentInfoRouteNamed.establishmentInfo._path,
    child: (context) => EstablishmentInfoPage(),
  );
}

@override
void routes(r) => establishmentInfoRoutes(r);
