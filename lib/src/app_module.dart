import 'features/arena_details/presenter/pages/arena_details_page.dart';
import 'features/auth/presenter/pages/auth_page.dart';
import 'features/establishment_details/presenter/viewmodels/establishment_info_viewmodel.dart';
import 'features/profile/presenter/pages/profile_page.dart';
import 'features/register/presenter/pages/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'features/home/presenter/pages/home_page.dart';
import 'features/establishment_details/presenter/pages/establishment_details_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // Registra o ViewModel como singleton
    i.addSingleton<EstablishmentInfoViewModel>(EstablishmentInfoViewModel.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => AuthPage());
    r.child('/register', child: (context) => RegisterPage());
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
