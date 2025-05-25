import 'package:mobx/mobx.dart';

part 'establishment_info_viewmodel.g.dart';

class EstablishmentInfoViewModel = _EstablishmentInfoViewModelBase
    with _$EstablishmentInfoViewModel;

abstract class _EstablishmentInfoViewModelBase with Store {
  @observable
  String establishment = '';

  @action
  void setEstablishmentId(String id) {
    establishment = id;
  }

  @computed
  String get displayEstablishmentId => 'Establishment ID: $establishment';
}
