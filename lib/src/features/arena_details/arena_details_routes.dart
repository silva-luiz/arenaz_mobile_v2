import 'package:flutter_modular/flutter_modular.dart';
import '../establishment_details/presenter/pages/establishment_details_page.dart';

enum ArenaDetailsRouteNamed { arenaDetails }

extension EstablishmentInfoRouteNamedExtension on ArenaDetailsRouteNamed {
  String get _path {
    switch (this) {
      case ArenaDetailsRouteNamed.arenaDetails:
        return '/:id';
    }
  }
}

void arenaDetailsRoutes(RouteManager r) {
  r.child(
    ArenaDetailsRouteNamed.arenaDetails._path,
    child: (context) {
      final id = Modular.args.params['id']; // captura o `:id`
      final arguments =
          Modular.args.data as Map<String, dynamic>?; // argumentos extras

      return EstablishmentDetailsPage(id: id!, arguments: arguments ?? {});
    },
  );
}

@override
void routes(r) => arenaDetailsRoutes(r);
