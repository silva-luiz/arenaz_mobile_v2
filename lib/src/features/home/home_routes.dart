import 'package:arenaz_mobile_v2/src/features/home/presenter/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../establishment_info/presenter/pages/establishment_details_page.dart';

enum HomeRouteNamed { home, establishmentDetails }

extension HomeRouteNamedExtension on HomeRouteNamed {
  String get _path {
    switch (this) {
      case HomeRouteNamed.home:
        return '/';
      case HomeRouteNamed.establishmentDetails:
        return '/establishment/details/:id';
      default:
        return '/';
    }
  }
}
void homeRoutes(RouteManager r) {
  r.child(HomeRouteNamed.home._path, child: (context) => const HomePage());

  r.child(
    HomeRouteNamed.establishmentDetails._path,
    child: (context) {
      final id = Modular.args.params['id'];
      final args = Modular.args.data as Map<String, dynamic>?;

      return EstablishmentDetailsPage(
        id: id ?? '',
        arguments: args ?? {},
      );
    },
  );
}


@override
void routes(r) => homeRoutes(r);
