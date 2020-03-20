import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/input_form_validators.dart';
import 'package:my_dinner/features/auth/presentation/provider/password_forgotten_provider.dart';

class PasswordForgottenDialog extends StatefulWidget {
  @override
  _PasswordForgottenDialogState createState() =>
      _PasswordForgottenDialogState();
}

class _PasswordForgottenDialogState extends State<PasswordForgottenDialog> {
  final _formKey = GlobalKey<FormState>();

  PasswordForgottenProvider provider;
  String email;
  bool emailNotFound = false;

  @override
  void initState() {
    super.initState();
    provider = locator.get<PasswordForgottenProvider>();
    provider.addListener(() {
      if (provider.showEmailNotFound) {
        setState(() {
          emailNotFound = true;
          _formKey.currentState.validate();
        });
      } else if (provider.passwordForgottenSuccess) {
        Navigator.pop(context, true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Odzyskiwanie hasła',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Adres email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => emailNotFound = false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pole nie może być puste';
                  }
                  if (!InputValidators.validateEmail(value)) {
                    return 'Wprowadź poprawny adres email';
                  }
                  if (emailNotFound) {
                    return 'Podany email nie istnieje';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text('Anuluj'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text('Wyślij link'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        provider.requestPasswordForgotten(email);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
