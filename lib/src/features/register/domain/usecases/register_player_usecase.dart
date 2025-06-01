import '../repository/register_repository.dart';

class RegisterPlayerUseCase {
  final RegisterRepository repository;

  RegisterPlayerUseCase(this.repository);

  Future<void> call({
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
  }) async {
    if (userPassword != userConfirmPassword) {
      throw Exception('As senhas não coincidem');
    }

    await repository.registerPlayer(
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
    );
  }
}
