import 'package:either_option/either_option.dart';
import 'package:mobx/mobx.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

import 'package:my_dinner/features/address/domain/usecases/add_address.dart';
import 'package:my_dinner/features/address/domain/usecases/delete_address.dart';
import 'package:my_dinner/features/address/domain/usecases/update_address.dart';

part 'address_details_store.g.dart';

class AddressDetailsStore = _AddressDetailsStore with _$AddressDetailsStore;

abstract class _AddressDetailsStore with Store {
  final UpdateAddress _updateAddress;
  final CreateAddress _createAddress;
  final DeleteAddress _deleteAddress;

  _AddressDetailsStore(
    this._updateAddress,
    this._createAddress,
    this._deleteAddress,
  );

  @observable
  ObservableFuture _addressFuture;

  @computed
  bool get loading =>
      _addressFuture != null && _addressFuture.status == FutureStatus.pending;

  @observable
  bool createSuccess = false;

  @observable
  bool updateSuccess = false;

  @observable
  bool deleteSuccess = false;

  @action
  Future<void> update(Address address) async {
    if (address == null) return;
    _addressFuture =
        ObservableFuture(_updateAddress(UpdateAddressParams(address: address)));
    Either either = await _addressFuture;
    either.fold(
      (error) {},
      (address) => updateSuccess = true,
    );
  }

  @action
  Future<void> create(Address address) async {
    if (address == null) return;
    _addressFuture =
        ObservableFuture(_createAddress(AddAddressParams(address: address)));
    Either either = await _addressFuture;
    either.fold(
      (error) {},
      (address) => createSuccess = true,
    );
  }

  @action
  Future<void> delete(Address address) async {
    if (address == null) return;
    _addressFuture =
        ObservableFuture(_deleteAddress(DeleteAddressParams(address: address)));
    Either either = await _addressFuture;
    either.fold(
      (error) {},
      (address) => deleteSuccess = true,
    );
  }
}
