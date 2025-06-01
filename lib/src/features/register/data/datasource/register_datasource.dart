abstract class RegisterDatasource {
  Future<Map<String, dynamic>> registerPlayer({
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
    required bool isOwner,
  });
}
