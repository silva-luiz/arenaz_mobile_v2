import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/register_player_usecase.dart';

part 'register_viewmodel.g.dart';

class RegisterViewmodel = _RegisterViewmodelBase with _$RegisterViewmodel;

abstract class _RegisterViewmodelBase with Store {
  final Dio _dio;
  _RegisterViewmodelBase({Dio? dio}) : _dio = dio ?? Dio();
  final _registerPlayerUsecase = Modular.get<RegisterPlayerUseCase>();

  // User info
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

  // Address info
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
  String complement = '';

  // State
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  // Validations
  @computed
  bool get isNameValid => name.length >= 3;

  @computed
  bool get isEmailValid =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isConfirmPasswordValid => confirmPassword == password;

  @computed
  bool get isPhoneValid => phone.length >= 10;

  @computed
  bool get isCepValid => cep.isEmpty || cep.length == 8;

  @computed
  bool get isAddressValid => address.isNotEmpty;

  @computed
  bool get isFormValid =>
      isNameValid &&
      isEmailValid &&
      isPasswordValid &&
      isConfirmPasswordValid &&
      isPhoneValid &&
      isCepValid &&
      isAddressValid &&
      city.isNotEmpty &&
      state.isNotEmpty &&
      neighborhood.isNotEmpty &&
      number.isNotEmpty;

  // Actions
  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @action
  void setPhone(String value) =>
      phone = value.replaceAll(RegExp(r'[^0-9]'), '');

  @action
  void setCep(String value) {
    final newCep = value.replaceAll(RegExp(r'[^0-9]'), '');
    cep = newCep;
    if (newCep.length == 8) {
      fetchAddressByCep(newCep);
    }
  }

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
  void setComplement(String value) => complement = value;

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> fetchAddressByCep(String cep) async {
    isLoading = true;
    errorMessage = null;

    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');

      if (response.statusCode == 200) {
        if (response.data['erro'] == true) {
          errorMessage = 'CEP não encontrado';
        } else {
          if (address.isEmpty) address = response.data['logradouro'] ?? '';
          if (neighborhood.isEmpty)
            neighborhood = response.data['bairro'] ?? '';
          if (city.isEmpty) city = response.data['localidade'] ?? '';
          if (state.isEmpty) state = response.data['uf'] ?? '';
        }
      }
    } on DioException catch (e) {
      errorMessage =
          'Erro ao buscar CEP. Verifique sua conexão ou o CEP digitado.';
      print('Erro ao buscar endereço: $e');
    } catch (e) {
      errorMessage = 'Ocorreu um erro inesperado';
      print('Erro inesperado: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> registerPlayer() async {
    setLoading(true);
    final result = await _registerPlayerUsecase.call(
      userName: name,
      userPhone: phone,
      userEmail: email,
      userPassword: password,
      userConfirmPassword: confirmPassword,
      userCep: cep,
      userAddress: address,
      userNeighborhood: neighborhood,
      userCity: city,
      userState: state,
    );
  }
}
