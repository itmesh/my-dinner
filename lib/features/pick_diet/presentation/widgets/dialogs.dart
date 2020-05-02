import 'package:flutter/material.dart';

Future<bool> showCloseAppDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Zamknięcie aplikacji'),
        content: Text('Czy na penwno chcesz zamknąć aplikacje?'),
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
