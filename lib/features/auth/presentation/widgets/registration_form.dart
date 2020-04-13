import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/url_helper.dart';
import 'package:my_dinner/core/services/utils/constants.dart';

typedef OnRegister = void Function(String user, String password);

class RegistrationForm extends StatefulWidget {
  final OnRegister onRegister;

  const RegistrationForm({
    Key key,
    @required this.onRegister,
  })  : assert(onRegister != null, 'onRegister can not be null'),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationFormState();
  }
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_registrationFormKey');
  bool rulesAccepted = false;
  String email;
  String password;
  String rulesError;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Adres email',
            ),
            validator: (value) {
              return value.isEmpty ? 'Pole nie może być puste' : null;
            },
            onSaved: (value) => email = value,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Hasło',
            ),
            validator: (value) {
              return value.isEmpty ? 'Pole nie może być puste' : null;
            },
            onChanged: (value) => password = value,
            onSaved: (value) => password = value,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Powtórz hasło',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Pole nie może być puste';
              }
              if (value != password) {
                print(value);
                print(password);
                return 'Hasła nie są takie same';
              }
              return null;
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          LinkedLabelSwitch(
            error: rulesError,
            onTap: () {
              URLHelper.open(URLs.rules);
            },
            label: 'Akceptuje regulamin i polityke prywatności',
            onChanged: (value) {
              setState(() {
                rulesAccepted = value;
              });
            },
            padding: const EdgeInsets.all(0.0),
            value: rulesAccepted,
          ),
          SizedBox(
            height: 24.0,
          ),
          ButtonTheme(
            minWidth: 160.0,
            height: 44.0,
            child: RaisedButton.icon(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                _validateRules();
                if (_formKey.currentState.validate() && rulesAccepted) {
                  _formKey.currentState.save();
                  FocusScope.of(context).unfocus();
                  widget.onRegister(email, password);
                }
              },
              icon: Icon(Icons.send),
              label: Text('Zarejestruj'),
            ),
          )
        ],
      ),
    );
  }

  void _validateRules() {
    setState(() {
      if (rulesAccepted) {
        rulesError = null;
        return true;
      } else {
        rulesError = 'Regulamin nie został zaakceptowany';
        return false;
      }
    });
  }
}

class LinkedLabelSwitch extends StatelessWidget {
  const LinkedLabelSwitch({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
    this.onTap,
    this.error,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;
  final GestureTapCallback onTap;
  final String error;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: label,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (onTap != null) {
                          onTap();
                        }
                      },
                  ),
                ),
              ),
              Switch(
                value: value,
                onChanged: (bool newValue) {
                  onChanged(newValue);
                },
              ),
            ],
          ),
          if (error != null)
            Text(
              error,
              style: themeData.textTheme.caption
                  .copyWith(color: themeData.errorColor)
                  .merge(
                    themeData.inputDecorationTheme.helperStyle,
                  ),
              overflow: TextOverflow.ellipsis,
            )
        ],
      ),
    );
  }
}
