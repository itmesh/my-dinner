import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';

abstract class MyDietApi {
  Future<List<Diet>> getDiets(DateTime day);
}

@RegisterAs(MyDietApi)
@singleton
class MyDietApiHttp implements MyDietApi {
  MyDietApiHttp();

  @override
  Future<List<Diet>> getDiets(DateTime day) async {
    throw UnimplementedError();
  }
}

@RegisterAs(MyDietApi, env: Env.demo)
@singleton
class MyDietApiDemo implements MyDietApi {
  @override
  Future<List<Diet>> getDiets(DateTime day) async {
    await Future.delayed(Duration(seconds: 2));
    String response;
    if (day.day % 2 == 0) {
      response = await rootBundle.loadString('assets/demo/diet.json');
    } else {
      response = await rootBundle.loadString('assets/demo/no_diet.json');
    }
    List<Diet> diets =
        json.decode(response).map<Diet>((e) => Diet.fromJson(e)).toList();
    // throw Exception();
    return diets;
  }
}
