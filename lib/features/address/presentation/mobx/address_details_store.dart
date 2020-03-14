import 'package:either_option/either_option.dart';
import 'package:mobx/mobx.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

import 'package:my_dinner/features/address/domain/usecases/add_address.dart';
import 'package:my_dinner/features/address/domain/usecases/delete_address.dart';
import 'package:my_dinner/features/address/domain/usecases/update_address.dart';

part 'address_details_store.g.dart';

class AddressDetailsStore = _AddressDetailsStore with _$AddressDetailsStore;

abstract class _AddressDetailsStore with Store {
  final UpdateAddress updateAddress;
  final CreateAddress addAddress;
  final DeleteAddress deleteAddress;

  _AddressDetailsStore(this.updateAddress, this.addAddress, this.deleteAddress);

  @action
  Future<void> update(Address address) async {
    if (address == null) return;

    Either either = await updateAddress(UpdateAddressParams(address: address));
    either.fold(
      (error) {},
      (address) {},
    );
  }

  @action
  Future<void> create(Address address) async {
    if (address == null) return;

    Either either = await addAddress(AddAddressParams(address: address));
    either.fold(
      (error) {},
      (address) {},
    );
  }

  @action
  Future<void> delete(Address address) async {
    if (address == null) return;

    Either either = await deleteAddress(DeleteAddressParams(address: address));
    either.fold(
      (error) {},
      (address) {},
    );
  }
}
