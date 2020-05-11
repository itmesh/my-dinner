import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/features/new_order/data/dtos/order_dto.dart';

abstract class NewOrderApi {
  Future<void> createOrder(OrderDto newOrder);
}

@RegisterAs(NewOrderApi, env: Env.dev)
@singleton
class NewOrderHttpApi extends NewOrderApi {
  final MyHttpClient _myHttpClient;

  NewOrderHttpApi(this._myHttpClient);

  @override
  Future<void> createOrder(OrderDto newOrder) {
    print(newOrder.toJson());
    return _myHttpClient.post(
      path: '/client/order',
      body: json.encode(newOrder.toJson()),
      out: (value) => null,
    );
  }
}

@RegisterAs(NewOrderApi, env: Env.demo)
@singleton
class NewOrderDemoApi extends NewOrderApi {
  @override
  Future<void> createOrder(OrderDto newOrder) {
    throw UnimplementedError();
  }
}
