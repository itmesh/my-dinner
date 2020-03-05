import 'package:flutter/material.dart';

typedef OnChange<T> = void Function(T value);

class MaterialDropDown<T> extends StatelessWidget {
  final DropdownButtonFormField dropDown;
  final String title;

  const MaterialDropDown({
    Key key,
    this.title,
    this.dropDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12.0,
                color: Color(0x8A000000),
                fontWeight: FontWeight.w400),
          ),
        ),
        dropDown,
      ],
    );
  }
}
