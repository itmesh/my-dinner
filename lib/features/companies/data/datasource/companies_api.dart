import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/companies/domain/models/company.dart';

abstract class CompaniesApi {
  Future<List<Company>> getCompanies();
}

class CompaniesApiHttp extends CompaniesApi {
  @override
  Future<List<Company>> getCompanies() async {
    throw UnimplementedError();
  }
}

class CompaniesApiDemo extends CompaniesApi {
  @override
  Future<List<Company>> getCompanies() async {
    await DemoUtils.smallDelay;

    String response = await rootBundle.loadString('assets/demo/companies.json');

    return json.decode(response).map((e) => Company.fromJson(e)).toList();
  }
}
