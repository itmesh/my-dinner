import 'package:mobx/mobx.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';
import 'package:validators/validators.dart';
import 'package:my_dinner/features/address/presentation/mobx/address_form_error_state.dart';

part 'address_form_store.g.dart';

class AddressFormStore = _AddressFormStore with _$AddressFormStore;

abstract class _AddressFormStore with Store {
  final AddressFormErrorState errors = AddressFormErrorState();
  Address oldAddress;

  @observable
  String street = '';

  @observable
  String homeFlatNumber = '';

  @observable
  String city = '';

  @observable
  String postalCode = '';

  @observable
  String remarks = '';

  @observable
  DeliveryHours deliveryHours = DeliveryHours();

  @action
  void setStreet(String street) {
    this.street = street;
  }

  @action
  void setHomeFlatNumber(String homeFlatNumber) {
    this.homeFlatNumber = homeFlatNumber;
  }

  @action
  void setCity(String city) {
    this.city = city;
  }

  @action
  void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  @action
  void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  @action
  void setDeliveryHours(DeliveryHours deliveryHours) {
    this.deliveryHours = deliveryHours;
  }

  @computed
  bool get canSave => !errors.anyExists;

  List<ReactionDisposer> _disposers;

  void initialize(Address address) {
    if (address != null) {
      street = address.street ?? '';
      homeFlatNumber = address.homeFlatNumber ?? '';
      city = address.city ?? '';
      postalCode = address.postalCode ?? '';
      remarks = address.remarks ?? '';
      oldAddress = getAddress();
      deliveryHours = _convertToDeliveryHours(address);
    }
    _setupValidations();
  }

  DeliveryHours _convertToDeliveryHours(Address address) {
    DeliveryHours deliveryHours = DeliveryHours(
      fromHour: address.fromHour,
      toHour: address.toHour,
    );
    return DeliveryHours.availableHours
        .firstWhere((e) => e == deliveryHours, orElse: () => DeliveryHours());
  }

  Address getAddress() {
    return Address(
      street: street,
      homeFlatNumber: homeFlatNumber,
      city: city,
      postalCode: postalCode,
      remarks: remarks,
      fromHour: deliveryHours?.fromHour,
      toHour: deliveryHours?.toHour,
    );
  }

  bool get edited => getAddress() != oldAddress;

  void _setupValidations() {
    _disposers = [
      reaction((_) => street, validateStreet),
      reaction((_) => homeFlatNumber, validateHomeFlatNumber),
      reaction((_) => city, validateCity),
      reaction((_) => postalCode, validatePostalCode),
    ];
  }

  void validateAll() {
    validateStreet(street);
    validateHomeFlatNumber(homeFlatNumber);
    validateCity(city);
    validatePostalCode(postalCode);
  }

  @action
  void validateStreet(String street) {
    errors.street =
        isNull(street) || street.isEmpty ? 'Pole jest wymagane' : null;
  }

  @action
  void validateHomeFlatNumber(String homeFlatNumber) {
    errors.homeFlatNumber = isNull(homeFlatNumber) || homeFlatNumber.isEmpty
        ? 'Pole jest wymagane'
        : null;
  }

  @action
  void validateCity(String city) {
    errors.city = isNull(city) || city.isEmpty ? 'Pole jest wymagane' : null;
  }

  @action
  void validatePostalCode(String postalCode) {
    errors.postalCode = isNull(postalCode) || postalCode.isEmpty
        ? 'Wymagany format 00-000'
        : null;
  }

  @action
  void validateRemarks(String deliveryHours) {
    errors.remarks = isNull(deliveryHours) || deliveryHours.isEmpty
        ? 'Pole jest wymagane'
        : null;
  }

  void dispose() {
    for (final d in _disposers) d();
  }
}
