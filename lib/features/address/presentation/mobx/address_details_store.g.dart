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

  final _$createSuccessAtom = Atom(name: '_AddressDetailsStore.createSuccess');

  @override
  bool get createSuccess {
    _$createSuccessAtom.context.enforceReadPolicy(_$createSuccessAtom);
    _$createSuccessAtom.reportObserved();
    return super.createSuccess;
  }

  @override
  set createSuccess(bool value) {
    _$createSuccessAtom.context.conditionallyRunInAction(() {
      super.createSuccess = value;
      _$createSuccessAtom.reportChanged();
    }, _$createSuccessAtom, name: '${_$createSuccessAtom.name}_set');
  }

  final _$updateSuccessAtom = Atom(name: '_AddressDetailsStore.updateSuccess');

  @override
  bool get updateSuccess {
    _$updateSuccessAtom.context.enforceReadPolicy(_$updateSuccessAtom);
    _$updateSuccessAtom.reportObserved();
    return super.updateSuccess;
  }

  @override
  set updateSuccess(bool value) {
    _$updateSuccessAtom.context.conditionallyRunInAction(() {
      super.updateSuccess = value;
      _$updateSuccessAtom.reportChanged();
    }, _$updateSuccessAtom, name: '${_$updateSuccessAtom.name}_set');
  }

  final _$deleteSuccessAtom = Atom(name: '_AddressDetailsStore.deleteSuccess');

  @override
  bool get deleteSuccess {
    _$deleteSuccessAtom.context.enforceReadPolicy(_$deleteSuccessAtom);
    _$deleteSuccessAtom.reportObserved();
    return super.deleteSuccess;
  }

  @override
  set deleteSuccess(bool value) {
    _$deleteSuccessAtom.context.conditionallyRunInAction(() {
      super.deleteSuccess = value;
      _$deleteSuccessAtom.reportChanged();
    }, _$deleteSuccessAtom, name: '${_$deleteSuccessAtom.name}_set');
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
        'createSuccess: ${createSuccess.toString()},updateSuccess: ${updateSuccess.toString()},deleteSuccess: ${deleteSuccess.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
