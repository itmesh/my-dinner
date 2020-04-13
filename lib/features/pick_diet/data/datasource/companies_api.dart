import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/company_dto.dart';

abstract class CompaniesApi {
  Future<List<CompanyDto>> getCompanies();
}

@RegisterAs(CompaniesApi)
@singleton
class CompaniesApiHttp extends CompaniesApi {
  @override
  Future<List<CompanyDto>> getCompanies() async {
    throw UnimplementedError();
  }
}

@RegisterAs(CompaniesApi, env: Env.demo)
@singleton
class CompaniesApiDemo extends CompaniesApi {
  @override
  Future<List<CompanyDto>> getCompanies() async {
    await DemoUtils.smallDelay;

    String response = await rootBundle.loadString('assets/demo/companies.json');

    return json
        .decode(response)
        .map<CompanyDto>((e) => CompanyDto.fromJson(e))
        .toList();
  }
}
