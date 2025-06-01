import 'data/datasource/register_datasource.dart';
import 'data/datasource/register_datasource_impl.dart';
import 'data/repository/register_repository_impl.dart';
import 'domain/repository/register_repository.dart';
import 'domain/usecases/register_player_usecase.dart';
import 'presenter/viewmodels/register_viewmodel.dart';

void registerBinds(i) {
  i.addLazySingleton<RegisterDatasource>(RegisterDatasourceImpl.new);
  i.addLazySingleton<RegisterRepository>(RegisterRepositoryImpl.new);
  i.addLazySingleton<RegisterPlayerUseCase>(RegisterPlayerUseCase.new);
  i.addLazySingleton<RegisterViewmodel>(RegisterViewmodel.new);
}
