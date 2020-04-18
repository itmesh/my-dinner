import 'package:mobx/mobx.dart';

part 'address_form_error_state.g.dart';

class AddressFormErrorState = _AddressFormErrorState
    with _$AddressFormErrorState;

abstract class _AddressFormErrorState with Store {
  @observable
  String street;

  @observable
  String homeFlatNumber;

  @observable
  String city;

  @observable
  String postalCode;

  @observable
  String deliveryHours;

  @observable
  String remarks;

  @computed
  bool get anyExists =>
      street != null ||
      homeFlatNumber != null ||
      city != null ||
      postalCode != null ||
      deliveryHours != null ||
      remarks != null;
}
