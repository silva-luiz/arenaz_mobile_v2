import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/register_page.dart';

enum RegisterRouteNamed { register }

extension ProfileRouteNamedExtension on RegisterRouteNamed {
  String get _path {
    switch (this) {
      case RegisterRouteNamed.register:
        return '/';
    }
  }
}

void registerRoutes(RouteManager r) {
  r.child(
    RegisterRouteNamed.register._path,
    child: (context) => const RegisterPage(),
  );
}

@override
void routes(r) => registerRoutes(r);
