import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/bloc.dart';

class AvailableDietCard extends StatelessWidget {
  final DietSet diet;
  final DateTime selectedDay;
  final MyDietBloc _bloc = locator.get();

  AvailableDietCard(this.diet, this.selectedDay);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(diet.name),
        subtitle: Text(diet.vendorName),
        trailing: Wrap(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () {
                _bloc.add(OrderMyDiet(selectedDay));
              },
            ),
          ],
        ),
      ),
    );
  }
}
