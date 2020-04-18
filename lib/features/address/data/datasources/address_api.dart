import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/address/data/dtos/address_dto.dart';

abstract class AddressApi {
  Future<List<AddressDto>> getAddresses();

  Future<AddressDto> createAddress(AddressDto address);

  Future<AddressDto> updateAddress(AddressDto address);

  Future<AddressDto> deleteAddress(AddressDto address);
}

@RegisterAs(AddressApi)
@singleton
class AddressHttpApi extends AddressApi {
  final MyHttpClient client;

  AddressHttpApi(this.client);

  @override
  Future<List<AddressDto>> getAddresses() {
    return client.get(
      path: '/client/address',
      out: (value) => _toList(value, (e) => AddressDto.fromJson(e)),
    );
  }

  @override
  Future<AddressDto> createAddress(AddressDto address) {
    return client.post(
      path: '/client/address/',
      body: address.toJson(),
      out: (value) => null,
    );
  }

  @override
  Future<AddressDto> updateAddress(AddressDto address) {
    return client.patch(
      path: '/client/address/',
      body: address.toJson(),
      out: (value) => null,
    );
  }

  @override
  Future<AddressDto> deleteAddress(AddressDto address) {
    return client.delete(
      path: '/client/address/${address.id}',
      out: (value) => null,
    );
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
  Future<AddressDto> createAddress(AddressDto address) async {
    await DemoUtils.mediumDelay;
    return address;
  }

  @override
  Future<AddressDto> updateAddress(AddressDto address) async {
    await DemoUtils.mediumDelay;
    return address;
  }

  @override
  Future<AddressDto> deleteAddress(AddressDto address) async {
    await DemoUtils.mediumDelay;
    return address;
  }
}

List<T> _toList<T>(dynamic list, T f(_)) {
  return (list as List<dynamic>).map(f).toList();
}
