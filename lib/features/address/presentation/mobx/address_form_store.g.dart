// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressFormStore on _AddressFormStore, Store {
  Computed<bool> _$canSaveComputed;

  @override
  bool get canSave =>
      (_$canSaveComputed ??= Computed<bool>(() => super.canSave)).value;

  final _$streetAtom = Atom(name: '_AddressFormStore.street');

  @override
  String get street {
    _$streetAtom.context.enforceReadPolicy(_$streetAtom);
    _$streetAtom.reportObserved();
    return super.street;
  }

  @override
  set street(String value) {
    _$streetAtom.context.conditionallyRunInAction(() {
      super.street = value;
      _$streetAtom.reportChanged();
    }, _$streetAtom, name: '${_$streetAtom.name}_set');
  }

  final _$homeFlatNumberAtom = Atom(name: '_AddressFormStore.homeFlatNumber');

  @override
  String get homeFlatNumber {
    _$homeFlatNumberAtom.context.enforceReadPolicy(_$homeFlatNumberAtom);
    _$homeFlatNumberAtom.reportObserved();
    return super.homeFlatNumber;
  }

  @override
  set homeFlatNumber(String value) {
    _$homeFlatNumberAtom.context.conditionallyRunInAction(() {
      super.homeFlatNumber = value;
      _$homeFlatNumberAtom.reportChanged();
    }, _$homeFlatNumberAtom, name: '${_$homeFlatNumberAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_AddressFormStore.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$postalCodeAtom = Atom(name: '_AddressFormStore.postalCode');

  @override
  String get postalCode {
    _$postalCodeAtom.context.enforceReadPolicy(_$postalCodeAtom);
    _$postalCodeAtom.reportObserved();
    return super.postalCode;
  }

  @override
  set postalCode(String value) {
    _$postalCodeAtom.context.conditionallyRunInAction(() {
      super.postalCode = value;
      _$postalCodeAtom.reportChanged();
    }, _$postalCodeAtom, name: '${_$postalCodeAtom.name}_set');
  }

  final _$remarksAtom = Atom(name: '_AddressFormStore.remarks');

  @override
  String get remarks {
    _$remarksAtom.context.enforceReadPolicy(_$remarksAtom);
    _$remarksAtom.reportObserved();
    return super.remarks;
  }

  @override
  set remarks(String value) {
    _$remarksAtom.context.conditionallyRunInAction(() {
      super.remarks = value;
      _$remarksAtom.reportChanged();
    }, _$remarksAtom, name: '${_$remarksAtom.name}_set');
  }

  final _$deliveryHoursAtom = Atom(name: '_AddressFormStore.deliveryHours');

  @override
  String get deliveryHours {
    _$deliveryHoursAtom.context.enforceReadPolicy(_$deliveryHoursAtom);
    _$deliveryHoursAtom.reportObserved();
    return super.deliveryHours;
  }

  @override
  set deliveryHours(String value) {
    _$deliveryHoursAtom.context.conditionallyRunInAction(() {
      super.deliveryHours = value;
      _$deliveryHoursAtom.reportChanged();
    }, _$deliveryHoursAtom, name: '${_$deliveryHoursAtom.name}_set');
  }

  final _$_AddressFormStoreActionController =
      ActionController(name: '_AddressFormStore');

  @override
  void setStreet(String street) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.setStreet(street);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHomeFlatNumber(String homeFlatNumber) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.setHomeFlatNumber(homeFlatNumber);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String city) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.setCity(city);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPostalCode(String postalCode) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.setPostalCode(postalCode);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRemarks(String remarks) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.setRemarks(remarks);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryHours(String deliveryHours) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.setDeliveryHours(deliveryHours);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateStreet(String street) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.validateStreet(street);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateHomeFlatNumber(String homeFlatNumber) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.validateHomeFlatNumber(homeFlatNumber);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCity(String city) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.validateCity(city);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePostalCode(String postalCode) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.validatePostalCode(postalCode);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRemarks(String deliveryHours) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.validateRemarks(deliveryHours);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDeliveryHours(String deliveryHours) {
    final _$actionInfo = _$_AddressFormStoreActionController.startAction();
    try {
      return super.validateDeliveryHours(deliveryHours);
    } finally {
      _$_AddressFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'street: ${street.toString()},homeFlatNumber: ${homeFlatNumber.toString()},city: ${city.toString()},postalCode: ${postalCode.toString()},remarks: ${remarks.toString()},deliveryHours: ${deliveryHours.toString()},canSave: ${canSave.toString()}';
    return '{$string}';
  }
}
