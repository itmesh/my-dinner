import 'package:either_option/either_option.dart';
import 'package:mobx/mobx.dart';

import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';

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
}
