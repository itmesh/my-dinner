import 'package:either_option/either_option.dart';
import 'package:mobx/mobx.dart';

import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';
import 'package:my_dinner/features/address/presentation/pages/address_details_page.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStore with _$AddressStore;

abstract class _AddressStore with Store {
  final GetAddresses getAddresses;

  _AddressStore(this.getAddresses);

  @observable
  List<Address> addresses = [];

  @observable
  bool loading = false;

  @action
  Future<void> download() async {
    loading = true;
    Either either = await getAddresses(NoParams());
    addresses = either.fold(
      (error) => [],
      (addresses) => addresses,
    );
    loading = false;
  }

  void performOperation(Address address, Operation operation) {
    switch (operation) {
      case Operation.create:
        addresses.add(address);
        break;
      case Operation.update:
        int indexToRemove = addresses.indexWhere((e) => e.id == address.id);
        addresses.removeAt(indexToRemove);
        addresses.insert(indexToRemove, address);
        break;
      case Operation.delete:
        addresses.removeWhere((e) => e.id == address.id);
        break;
    }
  }
}
