// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressStore on _AddressStore, Store {
  final _$addressesAtom = Atom(name: '_AddressStore.addresses');

  @override
  List<Address> get addresses {
    _$addressesAtom.context.enforceReadPolicy(_$addressesAtom);
    _$addressesAtom.reportObserved();
    return super.addresses;
  }

  @override
  set addresses(List<Address> value) {
    _$addressesAtom.context.conditionallyRunInAction(() {
      super.addresses = value;
      _$addressesAtom.reportChanged();
    }, _$addressesAtom, name: '${_$addressesAtom.name}_set');
  }

  final _$downloadAsyncAction = AsyncAction('download');

  @override
  Future<void> download() {
    return _$downloadAsyncAction.run(() => super.download());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<void> update(Address address) {
    return _$updateAsyncAction.run(() => super.update(address));
  }

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future<void> add(Address address) {
    return _$addAsyncAction.run(() => super.add(address));
  }

  @override
  String toString() {
    final string = 'addresses: ${addresses.toString()}';
    return '{$string}';
  }
}
