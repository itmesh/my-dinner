import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_dto.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_order_dto.dart';

abstract class MyDietApi {
  Future<DietDayDto> getDiets(DateTime day);

  Future<DietOrderDto> orderDiet(DateTime day);
}

@RegisterAs(MyDietApi)
@singleton
class MyDietApiHttp implements MyDietApi {
  MyDietApiHttp();

  @override
  Future<DietDayDto> getDiets(DateTime day) async {
    throw UnimplementedError();
  }

  @override
  Future<DietOrderDto> orderDiet(DateTime day) {
    throw UnimplementedError();
  }
}

@RegisterAs(MyDietApi, env: Env.demo)
@singleton
class MyDietApiDemo implements MyDietApi {
  @override
  Future<DietDayDto> getDiets(DateTime day) async {
    await DemoUtils.smallDelay;
    String response;
    if (day.day % 2 == 0) {
      response = await rootBundle.loadString('assets/demo/diet_day.json');
    } else {
      response = await rootBundle.loadString('assets/demo/empty_diet_day.json');
    }

    return DietDayDto.fromJson(json.decode(response));
  }

  @override
  Future<DietOrderDto> orderDiet(DateTime day) async {
    await DemoUtils.smallDelay;
    String response = await rootBundle.loadString('assets/demo/order.json');
    return DietOrderDto.fromJson(json.decode(response));
  }
}
