import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_dinner/main-demo.dart';

import 'core/services/injection.dart';

void main() {
  configureInjection(Env.dev);
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
