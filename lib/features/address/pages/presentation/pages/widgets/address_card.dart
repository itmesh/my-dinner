import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/pages/domain/entities/address.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final GestureTapCallback onEdit;
  final bool selected;
  final VoidCallback onTap;
  final TrailingIconType trailingIconType;

  const AddressCard({
    Key key,
    this.address,
    this.onEdit,
    this.selected = false,
    this.onTap,
    this.trailingIconType = TrailingIconType.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: selected
          ? RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(4.0),
            )
          : null,
      child: ListTile(
        onTap: onTap,
        title: Text('${address.street} ${address.homeFlatNumber}'),
        trailing: _trailing,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${address.postalCode} ${address.city}'),
              SizedBox(height: 4.0),
              Text('Godziny dostawy: ${address.deliveryHours}'),
              SizedBox(height: 2.0),
              Text('Dodatkowe uwagi: ${address.remarks}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _trailing {
    if (trailingIconType == TrailingIconType.edit) {
      return Container(
        height: 26.0,
        width: 26.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          clipBehavior: Clip.hardEdge,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onEdit,
              child: Icon(
                Icons.edit,
                size: 20.0,
              ),
            ),
          ),
        ),
      );
    } else if (trailingIconType == TrailingIconType.arrow) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.arrow_forward_ios, size: 20.0),
        ],
      );
    }
    return null;
  }
}

enum TrailingIconType {
  edit,
  arrow,
}
