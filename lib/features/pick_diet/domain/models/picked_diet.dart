import 'package:my_dinner/features/pick_diet/domain/models/company.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';

class PickedDiet {
  final Company company;
  final DietOffer dietOffer;
  final Calorie calorie;
  final String remark;
  final int setsCount;
  final List<DateTime> selectedDays;

  PickedDiet({
    this.company,
    this.dietOffer,
    this.calorie,
    this.remark,
    this.setsCount,
    this.selectedDays,
  });
}
