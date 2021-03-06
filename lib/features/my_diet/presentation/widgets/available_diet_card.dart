import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/bloc.dart';

class AvailableDietCard extends StatelessWidget {
  final DietSet diet;
  final DateTime selectedDay;

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
                BlocProvider.of<MyDietBloc>(context)
                    .add(OrderMyDiet(diet, selectedDay));
              },
            ),
          ],
        ),
      ),
    );
  }
}
