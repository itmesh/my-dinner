// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_form_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressFormErrorState on _AddressFormErrorState, Store {
  Computed<bool> _$anyExistsComputed;

  @override
  bool get anyExists =>
      (_$anyExistsComputed ??= Computed<bool>(() => super.anyExists)).value;

  final _$streetAtom = Atom(name: '_AddressFormErrorState.street');

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

  final _$homeFlatNumberAtom =
      Atom(name: '_AddressFormErrorState.homeFlatNumber');

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

  final _$cityAtom = Atom(name: '_AddressFormErrorState.city');

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

  final _$postalCodeAtom = Atom(name: '_AddressFormErrorState.postalCode');

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

  @override
  String toString() {
    final string =
        'street: ${street.toString()},homeFlatNumber: ${homeFlatNumber.toString()},city: ${city.toString()},postalCode: ${postalCode.toString()},anyExists: ${anyExists.toString()}';
    return '{$string}';
  }
}
