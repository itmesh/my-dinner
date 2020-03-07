import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

abstract class AddressApi {
  Future<List<Address>> getAddresses();

  Future<Address> addAddress(Address address);

  Future<Address> updateAddress(Address address);
}

@RegisterAs(AddressApi)
@singleton
class AddressHttpApi extends AddressApi {
  @override
  Future<List<Address>> getAddresses() {
    throw UnimplementedError();
  }

  @override
  Future<Address> addAddress(Address address) {
    throw UnimplementedError();
  }

  @override
  Future<Address> updateAddress(Address address) {
    throw UnimplementedError();
  }
}

@RegisterAs(AddressApi, env: Env.demo)
@singleton
class AddressDemoApi extends AddressApi {
  @override
  Future<List<Address>> getAddresses() async {
    await DemoUtils.smallDelay;
    String response = await rootBundle.loadString('assets/demo/addresses.json');
    return jsonDecode(response)
        .map<Address>((e) => Address.fromJson(e))
        .toList();
  }

  @override
  Future<Address> addAddress(Address address) async {
    await DemoUtils.smallDelay;
    return address;
  }

  @override
  Future<Address> updateAddress(Address address) async {
    await DemoUtils.smallDelay;
    throw address;
  }
}
