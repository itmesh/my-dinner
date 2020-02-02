import 'package:my_dinner/features/history_orders/domain/diet.dart';

class Meal {
  final String name;
  final String description;
  final DateTime servingDate;
  final Diet diet;

  Meal({
    this.name,
    this.description,
    this.servingDate,
    this.diet,
  });
}
