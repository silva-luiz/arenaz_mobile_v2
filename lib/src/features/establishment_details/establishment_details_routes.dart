import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/establishment_details_page.dart';

enum EstablishmentInfoRouteNamed { establishmentInfo }

extension EstablishmentInfoRouteNamedExtension on EstablishmentInfoRouteNamed {
  String get _path {
    switch (this) {
      case EstablishmentInfoRouteNamed.establishmentInfo:
        return '/:id';
    }
  }
}

void establishmentInfoRoutes(RouteManager r) {
  r.child(
    EstablishmentInfoRouteNamed.establishmentInfo._path,
    child: (context) {
      final id = Modular.args.params['id']; // captura o `:id`
      final arguments = Modular.args.data as Map<String, dynamic>?; // argumentos extras

      return EstablishmentDetailsPage(
        id: id!,
        arguments: arguments ?? {},
      );
    },
  );
}

@override
void routes(r) => establishmentInfoRoutes(r);
