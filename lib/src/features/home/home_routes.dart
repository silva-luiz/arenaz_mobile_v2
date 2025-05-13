import 'package:arenaz_mobile_v2/src/features/home/presenter/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum HomeRouteNamed { home }

extension HomeRouteNamedExtension on HomeRouteNamed {
  String get _path {
    switch (this) {
      case HomeRouteNamed.home:
        return '/';
      default:
        return '/';
    }
  }
}

void homeRoutes(RouteManager r) {
  r.child(HomeRouteNamed.home._path, child: (context) => const HomePage());
}

@override
void routes(r) => homeRoutes(r);
