import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DietForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DietFormState();
  }
}

class _DietFormState extends State<DietForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  AnimationController _controller;

  Animation<double> _calendarHeightFactor;
  bool _chooseDaysLater = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _calendarHeightFactor = _controller.drive(_easeInTween);
    _controller.value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Typ diety',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0x8A000000),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    DropdownButtonFormField(
                      onChanged: (_) {},
                      items: [
                        DropdownMenuItem(
                          child: Text('Klasyczna'),
                        ),
                        DropdownMenuItem(
                          child: Text('Dla aktywnych'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Kaloryczność',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0x8A000000),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    DropdownButtonFormField(
                      onChanged: (_) {},
                      items: [
                        DropdownMenuItem(
                          child: Text(''),
                        ),
                        DropdownMenuItem(
                          child: Text('2000'),
                        ),
                        DropdownMenuItem(
                          child: Text('3000'),
                        ),
                        DropdownMenuItem(
                          child: Text('4000'),
                        ),
                      ],
                    ),
                    SwitchListTile(
                      value: _chooseDaysLater,
                      onChanged: _handleChooseDaysLater,
                      title: Text('Wybiore dni później'),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text('Ilość wybranych dni: 10')),
                    AnimatedBuilder(
                        animation: _controller.view,
                        builder: (_, Widget child) {
                          return ClipRect(
                            child: Align(
                              heightFactor: _calendarHeightFactor.value,
                              child: child,
                            ),
                          );
                        },
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Center(
                            child: Container(
                              child: Text('KALENDARZ'),
                            ),
                          ),
                        )),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Uwagi',
                      ),
                      validator: (value) {
                        return value.isEmpty ? 'Puste pole' : null;
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Edytuj powyższe dane aby zapisać',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  RaisedButton.icon(
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _formKey.currentState.validate();
                    },
                    icon: Icon(Icons.save),
                    label: Text('Zapisz'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
}
