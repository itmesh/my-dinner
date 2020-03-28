import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  String email;
  String password;

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
            label: 'Akceptuje regulamin i polityke prywatności',
            onChanged: (_) {},
            padding: const EdgeInsets.all(0.0),
            value: true,
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
                if (_formKey.currentState.validate()) {
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
}

class LinkedLabelSwitch extends StatelessWidget {
  const LinkedLabelSwitch({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
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
                    print('Label has been tapped.');
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
    );
  }
}
