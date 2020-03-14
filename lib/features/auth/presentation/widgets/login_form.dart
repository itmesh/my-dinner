import 'package:flutter/material.dart';
import 'package:my_dinner/features/auth/presentation/widgets/password_forgotten_dialog.dart';

typedef OnLogin = void Function(String user, String password);
typedef OnForgottenPassword = void Function(String email);

class LoginForm extends StatefulWidget {
  final OnLogin onLogin;
  final OnForgottenPassword onPasswordForgotten;

  const LoginForm({
    Key key,
    this.onLogin,
    this.onPasswordForgotten,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_loginFormKey');

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
            onChanged: (value) => email = value,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Hasło',
            ),
            validator: (value) {
              return value.isEmpty ? 'Pole nie może być puste' : null;
            },
            onChanged: (value) => password = value,
          ),
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {
                showDialog(context: context, child: PasswordForgottenDialog())
                    .then((value) {
                  if (value ?? false) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Wiadomość z linkiem do zmiany hasła została wysłana na podany adres email'),
                    ));
                  }
                });
              },
              child: Text(
                'Zapomniałeś hasła?',
                style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          ButtonTheme(
            minWidth: 160.0,
            height: 44.0,
            child: RaisedButton.icon(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  if (widget.onLogin != null) {
                    widget.onLogin(email, password);
                  }
                }
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
