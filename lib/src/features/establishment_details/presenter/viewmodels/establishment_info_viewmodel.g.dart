// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_info_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EstablishmentInfoViewModel on _EstablishmentInfoViewModelBase, Store {
  Computed<String>? _$displayEstablishmentIdComputed;

  @override
  String get displayEstablishmentId => (_$displayEstablishmentIdComputed ??=
          Computed<String>(() => super.displayEstablishmentId,
              name: '_EstablishmentInfoViewModelBase.displayEstablishmentId'))
      .value;

  late final _$establishmentAtom = Atom(
      name: '_EstablishmentInfoViewModelBase.establishment', context: context);

  @override
  String get establishment {
    _$establishmentAtom.reportRead();
    return super.establishment;
  }

  @override
  set establishment(String value) {
    _$establishmentAtom.reportWrite(value, super.establishment, () {
      super.establishment = value;
    });
  }

  late final _$_EstablishmentInfoViewModelBaseActionController =
      ActionController(
          name: '_EstablishmentInfoViewModelBase', context: context);

  @override
  void setEstablishmentId(String id) {
    final _$actionInfo =
        _$_EstablishmentInfoViewModelBaseActionController.startAction(
            name: '_EstablishmentInfoViewModelBase.setEstablishmentId');
    try {
      return super.setEstablishmentId(id);
    } finally {
      _$_EstablishmentInfoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
establishment: ${establishment},
displayEstablishmentId: ${displayEstablishmentId}
    ''';
  }
}
