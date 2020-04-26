import 'package:flutter/material.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';

typedef OnUpdate = void Function(Profile profile);

class ProfileForm extends StatefulWidget {
  final Profile profile;
  final OnUpdate onUpdate;

  const ProfileForm({Key key, this.profile, this.onUpdate}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileFormState(profile);
  }
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final Profile profile;
  String name;
  String surname;
  String email;
  String phoneNumber;

  _ProfileFormState(this.profile);

  @override
  void initState() {
    super.initState();
    name = profile?.name ?? '';
    surname = profile?.surname ?? '';
    email = profile?.email ?? '';
    phoneNumber = profile?.phoneNumber ?? '';
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
                    initialValue: name,
                    decoration: InputDecoration(
                      labelText: 'Imie',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onChanged: (value) => name = value,
                  ),
                  TextFormField(
                    initialValue: surname,
                    decoration: InputDecoration(
                      labelText: 'Nazwisko',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onChanged: (value) => surname = value,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Numer telefonu',
                    ),
                    initialValue: phoneNumber,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onChanged: (value) => phoneNumber = value,
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
                    if (_formKey.currentState.validate()) {
                      Profile newProfile = Profile(
                        name: name,
                        surname: surname,
                        phoneNumber: phoneNumber,
                        email: email,
                      );
                      if (newProfile != profile) {
                        if (widget.onUpdate != null) {
                          widget.onUpdate(
                            Profile(
                              name: name,
                              surname: surname,
                              phoneNumber: phoneNumber,
                              email: email,
                            ),
                          );
                        }
                      }
                    }
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
