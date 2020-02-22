import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.iconfig.dart';

@injectableInit
void configureInjection(String environment) {
  GetIt.I.allowReassignment = true;
  $initGetIt(GetIt.I, environment: environment);
}

abstract class Env {
  static const demo = 'demo';
  static const dev = 'dev';
  static const prod = 'prod';
}

GetIt get locator => GetIt.I;