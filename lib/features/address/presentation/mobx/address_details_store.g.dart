// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressDetailsStore on _AddressDetailsStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading =>
      (_$loadingComputed ??= Computed<bool>(() => super.loading)).value;

  final _$_addressFutureAtom =
      Atom(name: '_AddressDetailsStore._addressFuture');

  @override
  ObservableFuture<dynamic> get _addressFuture {
    _$_addressFutureAtom.context.enforceReadPolicy(_$_addressFutureAtom);
    _$_addressFutureAtom.reportObserved();
    return super._addressFuture;
  }

  @override
  set _addressFuture(ObservableFuture<dynamic> value) {
    _$_addressFutureAtom.context.conditionallyRunInAction(() {
      super._addressFuture = value;
      _$_addressFutureAtom.reportChanged();
    }, _$_addressFutureAtom, name: '${_$_addressFutureAtom.name}_set');
  }

  final _$addressCreatedAtom =
      Atom(name: '_AddressDetailsStore.addressCreated');

  @override
  Address get addressCreated {
    _$addressCreatedAtom.context.enforceReadPolicy(_$addressCreatedAtom);
    _$addressCreatedAtom.reportObserved();
    return super.addressCreated;
  }

  @override
  set addressCreated(Address value) {
    _$addressCreatedAtom.context.conditionallyRunInAction(() {
      super.addressCreated = value;
      _$addressCreatedAtom.reportChanged();
    }, _$addressCreatedAtom, name: '${_$addressCreatedAtom.name}_set');
  }

  final _$addressUpdatedAtom =
      Atom(name: '_AddressDetailsStore.addressUpdated');

  @override
  Address get addressUpdated {
    _$addressUpdatedAtom.context.enforceReadPolicy(_$addressUpdatedAtom);
    _$addressUpdatedAtom.reportObserved();
    return super.addressUpdated;
  }

  @override
  set addressUpdated(Address value) {
    _$addressUpdatedAtom.context.conditionallyRunInAction(() {
      super.addressUpdated = value;
      _$addressUpdatedAtom.reportChanged();
    }, _$addressUpdatedAtom, name: '${_$addressUpdatedAtom.name}_set');
  }

  final _$addressDeletedAtom =
      Atom(name: '_AddressDetailsStore.addressDeleted');

  @override
  Address get addressDeleted {
    _$addressDeletedAtom.context.enforceReadPolicy(_$addressDeletedAtom);
    _$addressDeletedAtom.reportObserved();
    return super.addressDeleted;
  }

  @override
  set addressDeleted(Address value) {
    _$addressDeletedAtom.context.conditionallyRunInAction(() {
      super.addressDeleted = value;
      _$addressDeletedAtom.reportChanged();
    }, _$addressDeletedAtom, name: '${_$addressDeletedAtom.name}_set');
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<void> update(Address address) {
    return _$updateAsyncAction.run(() => super.update(address));
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<void> create(Address address) {
    return _$createAsyncAction.run(() => super.create(address));
  }

  final _$deleteAsyncAction = AsyncAction('delete');

  @override
  Future<void> delete(Address address) {
    return _$deleteAsyncAction.run(() => super.delete(address));
  }

  @override
  String toString() {
    final string =
        'addressCreated: ${addressCreated.toString()},addressUpdated: ${addressUpdated.toString()},addressDeleted: ${addressDeleted.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
