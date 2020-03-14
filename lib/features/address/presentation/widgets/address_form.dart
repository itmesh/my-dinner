import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';
import 'package:my_dinner/widgets/material_dropdown.dart';

class AddressForm extends StatefulWidget {
  final Address address;

  const AddressForm({
    Key key,
    this.address,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddressFormState();
  }
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  String street;
  String homeFlatNumber;
  String city;
  String postalCode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool canDelete = widget.address != null;
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
                    initialValue: widget.address?.street ?? '',
                    decoration: InputDecoration(
                      labelText: 'Ulica',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onSaved: (value) => street = value,
                  ),
                  TextFormField(
                    initialValue: widget.address?.homeFlatNumber ?? '',
                    decoration: InputDecoration(
                      labelText: 'Numer domu/lokalu',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onSaved: (value) => homeFlatNumber = value,
                  ),
                  TextFormField(
                    initialValue: widget.address?.city ?? '',
                    decoration: InputDecoration(
                      labelText: 'Miejscowość',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onSaved: (value) => city = value,
                  ),
                  TextFormField(
                    initialValue: widget.address?.postalCode ?? '',
                    decoration: InputDecoration(
                      labelText: 'Kod pocztowy',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pole jest wymagane';
                      }
                      return null;
                    },
                    onSaved: (value) => postalCode = value,
                  ),
                  MaterialDropdown(
                    title: 'Godziny dostawy',
                    dropDown: DropdownButtonFormField(
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
                    ),
                  ),
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
                if (canDelete)
                  OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(
                      color: Color(0xffd32f2f),
                    ),
                    child: Text('Usuń'),
                  ),
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  borderSide: BorderSide(
                    color: Color(0xFF2196f3),
                  ),
                  child: Text('Anuluj'),
                ),
                RaisedButton.icon(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Navigator.of(context).pop();
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
