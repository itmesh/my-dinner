import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/my_diet/data/models/diet.dart';

abstract class MyDietApi {
  Future<Diet> getDiet(DateTime day);
}

@RegisterAs(MyDietApi)
@singleton
class MyDietApiHttp implements MyDietApi {
  MyDietApiHttp();

  @override
  Future<Diet> getDiet(DateTime day) async {
    return Diet();
  }
}

@RegisterAs(MyDietApi, env: Env.demo)
@singleton
class MyDietApiDemo implements MyDietApi {
  @override
  Future<Diet> getDiet(DateTime day) async {
    await Future.delayed(Duration(seconds: 2));
    String response = await rootBundle.loadString('assets/demo/diet.json');

    // throw Exception();
    return Diet.fromJson(json.decode(response));
  }
}
