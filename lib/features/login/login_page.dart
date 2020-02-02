import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_dinner/features/login/widgets/login_form.dart';
import 'package:my_dinner/features/login/widgets/registration_form.dart';

class LoginPage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(0.8),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: LoginForm(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
