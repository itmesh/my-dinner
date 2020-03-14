import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/auth/presentation/provider/auth_provider.dart';
import 'package:my_dinner/features/auth/presentation/widgets/login_form.dart';
import 'package:my_dinner/features/auth/presentation/widgets/registration_form.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => AuthPage(),
    );
  }

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthProvider authProvider;
  bool inputData = false;
  KeyboardVisibilityNotification keyboardVisibilityNotification;

  @override
  void initState() {
    super.initState();
    authProvider = locator.get();
    keyboardVisibilityNotification = KeyboardVisibilityNotification();
    keyboardVisibilityNotification.addNewListener(
      onChange: (bool visible) {
        setState(() {
          inputData = visible;
        });
      },
    );
  }

  @override
  void dispose() {
    keyboardVisibilityNotification.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider(
        create: (_) => authProvider,
        child: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                  image: AssetImage('assets/images/food-background.jpg'),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Theme.of(context).cardColor.withOpacity(0.8),
                    child: TabBar(
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'LOGOWANIE',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'REJESTRACJA',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        TabBarView(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomPaint(
                                    painter: TrianglePainter(
                                      color: Theme.of(context).primaryColor,
                                      trianglePainterSide:
                                          TrianglePainterSide.left,
                                    ),
                                    size: Size(
                                      MediaQuery.of(context).size.width / 4,
                                      MediaQuery.of(context).size.width / 4,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16.0,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 8.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          color: Theme.of(context)
                                              .cardColor
                                              .withOpacity(0.8),
                                        ),
                                        width: MediaQuery.of(context).size.width *
                                            0.8,
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: LoginForm(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (!inputData)
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MyDietPage.route);
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Text('Otwórz bez logowania'),
                                                SizedBox(
                                                  width: 16.0,
                                                ),
                                                Icon(Icons.arrow_forward)
                                              ],
                                            ),
                                            elevation: 8.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CustomPaint(
                                    painter: TrianglePainter(
                                      color: Theme.of(context).primaryColor,
                                      trianglePainterSide:
                                          TrianglePainterSide.right,
                                    ),
                                    size: Size(
                                      MediaQuery.of(context).size.width / 4,
                                      MediaQuery.of(context).size.width / 4,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4.0)),
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(0.8),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: RegistrationForm(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final TrianglePainterSide trianglePainterSide;

  TrianglePainter({
    this.color = Colors.red,
    this.trianglePainterSide = TrianglePainterSide.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    Path path;
    switch (trianglePainterSide) {
      case TrianglePainterSide.left:
        path = _leftPath(size);
        break;
      case TrianglePainterSide.right:
        path = _rightPath(size);
        break;
    }
    canvas.drawPath(path, paint);
  }

  Path _rightPath(Size size) => Path()
    ..moveTo(0.0, 0.0)
    ..lineTo(size.width, size.height / 8)
    ..lineTo(size.width, 0.0)
    ..close();

  Path _leftPath(Size size) => Path()
    ..moveTo(0.0, 0.0)
    ..lineTo(0.0, size.height / 8)
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum TrianglePainterSide {
  left,
  right,
}
