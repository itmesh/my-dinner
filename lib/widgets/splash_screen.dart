import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/auth/presentation/pages/auth_page.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Session session = locator.get();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), _checkSession);
  }

  void _checkSession() async {
    bool initialized = await session.initFromPreferences();
    if (initialized) {
      Navigator.of(context).push(
        MyDietPage.routeWithParams(
          request: MyDietPageRequest(
            snackBarMessage: 'Użytkownik został zalogowany',
          ),
        ),
      );
    } else {
      Navigator.of(context).push(AuthPage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
