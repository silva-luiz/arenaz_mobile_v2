import 'package:mobx/mobx.dart';

part 'register_viewmodel.g.dart';

class RegisterViewmodel = _RegisterViewmodelBase with _$RegisterViewmodel;

abstract class _RegisterViewmodelBase with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  String phone = '';

  @observable
  String cep = '';

  @observable
  String address = '';

  @observable
  String city = '';

  @observable
  String state = '';

  @observable
  String neighborhood = '';

  @observable
  String number = '';

  @observable
  bool isLoading = false;

  @computed
  bool get isEmailValid => email.contains('@') && email.contains('.');

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isConfirmPasswordValid => confirmPassword == password;

  @computed
  bool get isFormValid =>
      name.isNotEmpty &&
      isEmailValid &&
      isPasswordValid &&
      isConfirmPasswordValid &&
      phone.isNotEmpty &&
      cep.isNotEmpty &&
      address.isNotEmpty &&
      city.isNotEmpty &&
      state.isNotEmpty &&
      neighborhood.isNotEmpty &&
      number.isNotEmpty;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setCep(String value) => cep = value;

  @action
  void setAddress(String value) => address = value;

  @action
  void setCity(String value) => city = value;

  @action
  void setState(String value) => state = value;

  @action
  void setNeighborhood(String value) => neighborhood = value;

  @action
  void setNumber(String value) => number = value;

  @action
Future<void> registerUser() async {
  if (!isFormValid) return;

  isLoading = true;
  try {
    // Chamada ao seu use case ou repository
  } catch (e) {
    // Trate erro
  } finally {
    isLoading = false;
  }
}
}
