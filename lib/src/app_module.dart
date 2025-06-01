import 'package:flutter_modular/flutter_modular.dart';

import 'features/arena_details/presenter/pages/arena_details_page.dart';
import 'features/auth/presenter/pages/auth_page.dart';
import 'features/establishment_details/presenter/pages/establishment_details_page.dart';
import 'features/establishment_details/presenter/viewmodels/establishment_info_viewmodel.dart';
import 'features/home/presenter/pages/home_page.dart';
import 'features/profile/presenter/pages/profile_page.dart';

// Importa o módulo de registro
import 'features/register/register_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<EstablishmentInfoViewModel>(EstablishmentInfoViewModel.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => AuthPage());

    // Usa o RegisterModule como submódulo
    r.module('/register', module: RegisterModule());

    r.child('/home', child: (context) => HomePage());
    r.child('/profile', child: (context) => ProfilePage());

    r.child(
      '/establishment/details/:id',
      child: (context) {
        final id = Modular.args.params['id'];
        final args = Modular.args.data as Map<String, dynamic>?;

        return EstablishmentDetailsPage(id: id ?? '', arguments: args ?? {});
      },
    );

    r.child(
      '/arena/details/:id',
      child: (context) {
        final id = Modular.args.params['id'];
        final args = Modular.args.data as Map<String, dynamic>?;

        return ArenaDetailsPage(id: id ?? '', arguments: args ?? {});
      },
    );
  }
}
