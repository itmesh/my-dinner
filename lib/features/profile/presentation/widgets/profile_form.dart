import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: 'Krzysztof',
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
                        initialValue: 'Wizner',
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
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Pole jest wymagane';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Numer telefonu',
                        ),
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
      ],
    );
  }
}
