import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_dinner/features/new_order/presentation/redux/new_order_redux.dart';

class PickedDietCard extends StatelessWidget {
  final PickedDietViewModel pickedDiet;
  final GestureTapCallback onEdit;

  PickedDietCard({this.pickedDiet, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${pickedDiet.companyName} \n'
            '${pickedDiet.dietName}'),
        trailing: Container(
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
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${pickedDiet.calorie} kcal'),
              SizedBox(height: 2.0),
              Text('Ilość zestawów: ${pickedDiet.setsCount}'),
              if (pickedDiet.remarks.isNotEmpty) ...[
                SizedBox(height: 2.0),
                Text('Uwagi: ${pickedDiet.remarks}'),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
