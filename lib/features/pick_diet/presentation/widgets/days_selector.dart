import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  Animation<double> _calendarHeightFactor;
  bool _chooseDaysLater = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _calendarHeightFactor = _controller.drive(_easeInTween);
    _controller.value = 1.0;
  }

  void _handleChooseDaysLater(bool value) {
    setState(() {
      _chooseDaysLater = value;
      if (!_chooseDaysLater) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          minLines: 2,
          maxLines: 8,
          decoration: new InputDecoration(labelText: "Dodaj uwagi do diety"),
          // Only numbers can be entered
        ),
        TextField(
          decoration: new InputDecoration(labelText: "Podaj ilość dni"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
        SwitchListTile(
          value: _chooseDaysLater,
          onChanged: _handleChooseDaysLater,
          title: Text('Wybiore dni później'),
        ),
        AnimatedBuilder(
            animation: _controller.view,
            builder: (_, Widget child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _calendarHeightFactor.value,
                  child: child,
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Zostało do zaznaczenia 10 dni')),
                ),
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    color: Colors.red.withOpacity(0.2),
                    child: Center(
                      child: Container(
                        child: Text('KALENDARZ'),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
