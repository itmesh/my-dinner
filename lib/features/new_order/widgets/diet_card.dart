import 'package:flutter/material.dart';
import 'package:my_dinner/features/history_orders/domain/diet.dart';

class DietCard extends StatelessWidget {
  final Diet diet;
  final GestureTapCallback onEdit;
  final GestureTapCallback onTap;
  final TrailingIconType trailingIconType;

  const DietCard({
    Key key,
    this.diet,
    this.onEdit,
    this.onTap,
    this.trailingIconType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(diet.name),
        trailing: _trailing,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ilość posiłków: ${diet.dietCounts}'),
              SizedBox(height: 2.0),
              Text('Dodatkowe uwagi: ${diet.remarks}'),
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
