import 'package:my_dinner/features/my_diet/domain/models/diet.dart';

abstract class MyDietEvent {
  MyDietEvent();
}

class LoadMyDiet extends MyDietEvent {
  final DateTime selectedDay;

  LoadMyDiet(this.selectedDay);
}

class OrderMyDiet extends MyDietEvent {
  final DietSet dietSet;
  final DateTime selectedDay;

  OrderMyDiet(this.dietSet, this.selectedDay);
}
