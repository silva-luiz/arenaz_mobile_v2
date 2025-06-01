// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewmodel on _RegisterViewmodelBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_RegisterViewmodelBase.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_RegisterViewmodelBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_RegisterViewmodelBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isConfirmPasswordValidComputed;

  @override
  bool get isConfirmPasswordValid => (_$isConfirmPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmPasswordValid,
              name: '_RegisterViewmodelBase.isConfirmPasswordValid'))
      .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_RegisterViewmodelBase.isPhoneValid'))
          .value;
  Computed<bool>? _$isCepValidComputed;

  @override
  bool get isCepValid =>
      (_$isCepValidComputed ??= Computed<bool>(() => super.isCepValid,
              name: '_RegisterViewmodelBase.isCepValid'))
          .value;
  Computed<bool>? _$isAddressValidComputed;

  @override
  bool get isAddressValid =>
      (_$isAddressValidComputed ??= Computed<bool>(() => super.isAddressValid,
              name: '_RegisterViewmodelBase.isAddressValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_RegisterViewmodelBase.isFormValid'))
          .value;

  late final _$nameAtom =
      Atom(name: '_RegisterViewmodelBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterViewmodelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterViewmodelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_RegisterViewmodelBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_RegisterViewmodelBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$cepAtom =
      Atom(name: '_RegisterViewmodelBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_RegisterViewmodelBase.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$cityAtom =
      Atom(name: '_RegisterViewmodelBase.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_RegisterViewmodelBase.state', context: context);

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$neighborhoodAtom =
      Atom(name: '_RegisterViewmodelBase.neighborhood', context: context);

  @override
  String get neighborhood {
    _$neighborhoodAtom.reportRead();
    return super.neighborhood;
  }

  @override
  set neighborhood(String value) {
    _$neighborhoodAtom.reportWrite(value, super.neighborhood, () {
      super.neighborhood = value;
    });
  }

  late final _$numberAtom =
      Atom(name: '_RegisterViewmodelBase.number', context: context);

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$complementAtom =
      Atom(name: '_RegisterViewmodelBase.complement', context: context);

  @override
  String get complement {
    _$complementAtom.reportRead();
    return super.complement;
  }

  @override
  set complement(String value) {
    _$complementAtom.reportWrite(value, super.complement, () {
      super.complement = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RegisterViewmodelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_RegisterViewmodelBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchAddressByCepAsyncAction =
      AsyncAction('_RegisterViewmodelBase.fetchAddressByCep', context: context);

  @override
  Future<void> fetchAddressByCep(String cep) {
    return _$fetchAddressByCepAsyncAction
        .run(() => super.fetchAddressByCep(cep));
  }

  late final _$registerPlayerAsyncAction =
      AsyncAction('_RegisterViewmodelBase.registerPlayer', context: context);

  @override
  Future<void> registerPlayer() {
    return _$registerPlayerAsyncAction.run(() => super.registerPlayer());
  }

  late final _$_RegisterViewmodelBaseActionController =
      ActionController(name: '_RegisterViewmodelBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNeighborhood(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setNeighborhood');
    try {
      return super.setNeighborhood(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
phone: ${phone},
cep: ${cep},
address: ${address},
city: ${city},
state: ${state},
neighborhood: ${neighborhood},
number: ${number},
complement: ${complement},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isConfirmPasswordValid: ${isConfirmPasswordValid},
isPhoneValid: ${isPhoneValid},
isCepValid: ${isCepValid},
isAddressValid: ${isAddressValid},
isFormValid: ${isFormValid}
    ''';
  }
}
