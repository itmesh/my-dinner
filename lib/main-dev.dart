import 'package:flutter/material.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/new_order/presentation/redux/store.dart';
import 'package:my_dinner/main-demo.dart';

import 'core/services/injection.dart';

void main() async {
  configureInjection(Env.dev);
  await NewOrderRedux.init();
  Log.config();
  runApp(MyApp());
}
