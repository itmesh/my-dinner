import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  final bool canDelete;

  const AddressForm({Key key, this.canDelete = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddressFormState();
  }
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ulica',
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
                      labelText: 'Numer domu/lokalu',
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
                      labelText: 'Miejscowość',
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
                      labelText: 'Kod pocztowy',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Godziny dostawy',
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
                        child: Text('Do godziny 6:00'),
                      ),
                      DropdownMenuItem(
                        child: Text('Do godziny 8:00'),
                      ),
                      DropdownMenuItem(
                        child: Text('Do godziny 10:00'),
                      ),
                      DropdownMenuItem(
                        child: Text('Do godziny 12:00'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (widget.canDelete)
                  OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(
                      color: Color(0xFF2196f3),
                    ),
                    child: Text('Usuń'),
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
    );
  }
}
