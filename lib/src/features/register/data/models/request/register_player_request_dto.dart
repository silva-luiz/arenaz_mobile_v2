class RegisterPlayerRequestDto {
  final String userName;
  final String userPhone;
  final String userEmail;
  final String userPassword;
  final String userCep;
  final String userAddress;
  final String userNeighborhood;
  final String userCity;
  final String userState;
  final bool isOwner;

  RegisterPlayerRequestDto({
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.userPassword,
    required this.userCep,
    required this.userAddress,
    required this.userNeighborhood,
    required this.userCity,
    required this.userState,
    required this.isOwner,
  });

  Map<String, dynamic> toJson() {
    return {
      'usr_name': userName,
      'usr_email': userEmail,
      'usr_password': userPassword,
      'usr_cell_phone': userPhone,
      'usr_zipcode': userCep,
      'usr_address': '${userAddress.trim()}, ${userNeighborhood.trim()}',
      'usr_city': userCity,
      'usr_state': userState,
      'is_owner': false,
    };
  }
}
