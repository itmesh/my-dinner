import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

abstract class AddressApi {
  Future<List<AddressDto>> getAddresses();

  Future<AddressDto> createAddress(Address address);

  Future<AddressDto> updateAddress(Address address);

  Future<AddressDto> deleteAddress(Address address);
}

@RegisterAs(AddressApi)
@singleton
class AddressHttpApi extends AddressApi {
  @override
  Future<List<AddressDto>> getAddresses() {
    throw UnimplementedError();
  }

  @override
  Future<AddressDto> createAddress(Address address) {
    throw UnimplementedError();
  }

  @override
  Future<AddressDto> updateAddress(Address address) {
    throw UnimplementedError();
  }

  @override
  Future<AddressDto> deleteAddress(Address address) {
    throw UnimplementedError();
  }
}

@RegisterAs(AddressApi, env: Env.demo)
@singleton
class AddressDemoApi extends AddressApi {
  @override
  Future<List<AddressDto>> getAddresses() async {
    await DemoUtils.mediumDelay;
    String response = await rootBundle.loadString('assets/demo/addresses.json');
    return jsonDecode(response)
        .map<AddressDto>((e) => AddressDto.fromJson(e))
        .toList();
  }

  @override
  Future<AddressDto> createAddress(Address address) async {
    await DemoUtils.mediumDelay;
    return address.toDto();
  }

  @override
  Future<AddressDto> updateAddress(Address address) async {
    await DemoUtils.mediumDelay;
    return address.toDto();
  }

  @override
  Future<AddressDto> deleteAddress(Address address) async {
    await DemoUtils.mediumDelay;
    return address.toDto();
  }
}
