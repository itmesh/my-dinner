import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/auth/presentation/pages/auth_page.dart';
import 'package:my_dinner/features/new_order/presentation/redux/store.dart';
import 'package:my_dinner/generated/l10n.dart';

void main() async {
  configureInjection(Env.demo);
  await NewOrderRedux.init();
  Log.config();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}
