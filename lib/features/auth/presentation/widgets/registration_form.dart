import 'package:flutter/material.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';

typedef OnRegister = void Function(String user, String password);

class RegistrationForm extends StatefulWidget {
  final OnRegister onRegister;

  const RegistrationForm({
    Key key,
    this.onRegister,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationFormState();
  }
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_registrationFormKey');

  @override
  Widget build(BuildContext context) {
    return Form(
      //  key: _formKey,
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
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Powtórz hasło',
            ),
            validator: (value) {
              return value.isEmpty ? 'Pole nie może być puste' : null;
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
              label: Text('Zarejestruj'),
            ),
          )
        ],
      ),
    );
  }
}
