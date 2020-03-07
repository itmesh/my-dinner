import 'package:either_option/either_option.dart';
import 'package:mobx/mobx.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/add_address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';
import 'package:my_dinner/features/address/domain/usecases/update_address.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStore with _$AddressStore;

abstract class _AddressStore with Store {
  final GetAddresses getAddresses;
  final UpdateAddress updateAddress;
  final AddAddress addAddress;

  _AddressStore(this.getAddresses, this.updateAddress, this.addAddress);

  @observable
  List<Address> addresses = [];

  @action
  Future<void> download() async {
    Either either = await getAddresses(NoParams());
    addresses = either.fold(
      (error) => [],
      (addresses) => addresses,
    );
  }

  @action
  Future<void> update(Address address) async {
    int indexToUpdate = addresses.indexOf(address);
    Either either = await updateAddress(UpdateAddressParams(address));
    either.fold(
      (error) {},
      (address) => _updateAddressInList(indexToUpdate, address),
    );
  }

  void _updateAddressInList(int index, Address address) {}

  @action
  Future<void> add(Address address) async {
    Either either = await addAddress(AddAddressParams(address));
    either.fold(
      (error) {},
      (address) => addresses.add(address),
    );
  }
}
