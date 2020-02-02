import 'package:flutter/material.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_loginFormKey');
  bool _rememberUser = false;

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
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Hasło',
            ),
            validator: (value) {
              return value.isEmpty ? 'Pole nie może być puste' : null;
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          SwitchListTile(
            title: Text('Zapamiętaj'),
            value: _rememberUser,
            onChanged: (value) {
              setState(() {
                _rememberUser = value;
              });
            },
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
                Navigator.of(context).pushReplacement(MyDietPage.route);
              },
              icon: Icon(Icons.send),
              label: Text('Zaloguj'),
            ),
          )
        ],
      ),
    );
  }
}
