import '../../domain/repository/register_repository.dart';
import '../datasource/register_datasource.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDatasource _datasource;

  RegisterRepositoryImpl(this._datasource);

  @override
  Future<void> registerPlayer({
    required String userName,
    required String userPhone,
    required String userEmail,
    required String userPassword,
    required String userConfirmPassword,
    required String userCep,
    required String userAddress,
    required String userNeighborhood,
    required String userCity,
    required String userState,
  }) {
    return _datasource.registerPlayer(
      userName: userName,
      userPhone: userPhone,
      userEmail: userEmail,
      userPassword: userPassword,
      userConfirmPassword: userConfirmPassword,
      userCep: userCep,
      userAddress: userAddress,
      userNeighborhood: userNeighborhood,
      userCity: userCity,
      userState: userState,
      isOwner: false,
    );
  }
}
