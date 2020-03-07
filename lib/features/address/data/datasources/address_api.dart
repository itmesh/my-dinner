import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

abstract class AddressApi {
  Future<List<Address>> getAddresses();
}

@RegisterAs(AddressApi)
@singleton
class AddressHttpApi extends AddressApi {
  @override
  Future<List<Address>> getAddresses() {
    throw UnimplementedError();
  }
}

@RegisterAs(AddressApi, env: Env.demo)
@singleton
class AddressDemoApi extends AddressApi {
  @override
  Future<List<Address>> getAddresses() async {
    await DemoUtils.smallDelay;
    String response = await rootBundle.loadString('asset/demo/addresses.json');
    return jsonDecode(response)
        .map<Address>((e) => Address.fromJson(e))
        .toList();
  }
}
