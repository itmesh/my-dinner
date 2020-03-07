import 'package:mobx/mobx.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStore with _$AddressStore;

abstract class _AddressStore with Store {
  @observable
  List<Address> addresses = [];

  @action
  void download() {

  }
}