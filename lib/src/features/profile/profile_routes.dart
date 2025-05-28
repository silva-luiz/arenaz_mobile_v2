import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/profile_page.dart';

enum ProfileRouteNamed { profile }

extension ProfileRouteNamedExtension on ProfileRouteNamed {
  String get _path {
    switch (this) {
      case ProfileRouteNamed.profile:
      return '/';
    }
  }
}

void profileRoutes(RouteManager r){
  r.child(ProfileRouteNamed.profile._path, child: (context)=> const ProfilePage());
}

@override
void routes(r) => profileRoutes(r);