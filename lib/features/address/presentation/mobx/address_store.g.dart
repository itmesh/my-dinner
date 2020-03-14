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

  final _$loadingAtom = Atom(name: '_AddressStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$downloadAsyncAction = AsyncAction('download');

  @override
  Future<void> download() {
    return _$downloadAsyncAction.run(() => super.download());
  }

  @override
  String toString() {
    final string =
        'addresses: ${addresses.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
