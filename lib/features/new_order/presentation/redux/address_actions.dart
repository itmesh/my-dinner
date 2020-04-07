import 'package:my_dinner/features/address/domain/models/address.dart';

class AddAddress {
  final Address address;

  AddAddress(this.address);
}

class PutAddresses {
  final List<Address> addresses;

  PutAddresses(this.addresses);
}

class EditAddress {
  final Address address;

  EditAddress(this.address);
}

class GetAddressList {}

class SelectAddress {
  final Address address;

  SelectAddress(this.address);
}
