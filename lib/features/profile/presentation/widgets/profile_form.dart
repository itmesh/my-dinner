import 'package:flutter/material.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/update_profile.dart';

class ProfileForm extends StatefulWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => ProfileForm(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _ProfileFormState();
  }
}

class _ProfileFormState extends State<ProfileForm> {
  final Session _session = locator.get();
  final UpdateProfile _updateProfile = locator.get();
  final _formKey = GlobalKey<FormState>();
  Profile _profile;

  @override
  void initState() {
    super.initState();
    _profile = _session.get().profile ?? Profile();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _profile.name ?? '',
                    decoration: InputDecoration(
                      labelText: 'Imie',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: _profile.surname ?? '',
                    decoration: InputDecoration(
                      labelText: 'Nazwisko',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: _profile.email ?? '',
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Numer telefonu',
                    ),
                    initialValue: _profile.phoneNumber ?? '',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton.icon(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                  icon: Icon(Icons.save),
                  label: Text('Zapisz'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
