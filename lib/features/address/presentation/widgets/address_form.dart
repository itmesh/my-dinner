import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/presentation/mobx/address_form_store.dart';
import 'package:my_dinner/widgets/material_dropdown.dart';

typedef OnCancel = void Function();
typedef OnDelete = void Function(Address address);
typedef OnUpdate = void Function(Address address);
typedef OnCreate = void Function(Address address);

class AddressForm extends StatefulWidget {
  final Address address;
  final OnCancel onCancel;
  final OnDelete onDelete;
  final OnUpdate onUpdate;
  final OnCreate onCreate;

  const AddressForm({
    Key key,
    this.address,
    this.onCancel,
    this.onDelete,
    this.onUpdate,
    this.onCreate,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddressFormState();
  }
}

class _AddressFormState extends State<AddressForm> {
  final AddressFormStore _formStore = AddressFormStore();

  @override
  void initState() {
    super.initState();
    _formStore.initialize(widget.address);
  }

  @override
  void dispose() {
    _formStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool canDelete = widget.address != null && widget.onDelete != null;
    bool canSave = (widget.onCreate != null && widget.address == null) ||
        (widget.onUpdate != null && widget.address != null);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildInputs(),
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
                    onPressed: () async {
                      if (await _confirmDelete()) {
                        widget.onDelete(widget.address);
                      }
                    },
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
                if (canSave)
                  RaisedButton.icon(
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _formStore.validateAll();
                      if (_formStore.canSave) {
                        if (_formStore.edited) {
                          Address addressToSave = _formStore.getAddress();
                          if (widget.onUpdate != null) {
                            if (widget.address != null) {
                              widget.onUpdate(addressToSave);
                            } else {
                              widget.onCreate(addressToSave);
                            }
                          }
                        } else {
                          _noChangesAlert();
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

  List<Widget> _buildInputs() {
    return [
      Observer(
        builder: (_) => TextFormField(
          initialValue: _formStore.street,
          onChanged: (v) => _formStore.setStreet(v),
          decoration: InputDecoration(
            labelText: 'Ulica',
            errorText: _formStore.errors.street,
          ),
        ),
      ),
      Observer(
        builder: (_) => TextFormField(
          initialValue: _formStore.homeFlatNumber,
          onChanged: (v) => _formStore.setHomeFlatNumber(v),
          decoration: InputDecoration(
            labelText: 'Numer domu/lokalu',
            errorText: _formStore.errors.homeFlatNumber,
          ),
        ),
      ),
      Observer(
        builder: (_) => TextFormField(
          initialValue: _formStore.city,
          onChanged: (v) => _formStore.setCity(v),
          decoration: InputDecoration(
            labelText: 'Miejscowość',
            errorText: _formStore.errors.city,
          ),
        ),
      ),
      Observer(
        builder: (_) => TextFormField(
          initialValue: _formStore.postalCode,
          onChanged: (v) => _formStore.setPostalCode(v),
          decoration: InputDecoration(
            labelText: 'Kod pocztowy',
            errorText: _formStore.errors.postalCode,
          ),
        ),
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
    ];
  }

  Future<bool> _confirmDelete() async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Usunięcie adresu'),
          content: Text('Czy na penwno chcesz usunąć ten adres?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Nie'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Tak'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }

  void _noChangesAlert() {
    showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Zapisanie adresu'),
          content: Text('Brak wprowadzonych zmian do zapisania'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}

class ValidatorHelper {
  static String of(BuildContext context, ValidatorError error) {
    switch (error) {
      case ValidatorError.empty:
        return 'Pole jest wymagane';
        break;
    }
    return null;
  }
}

enum ValidatorError {
  empty,
}
