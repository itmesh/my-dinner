import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/features/pick_diet/domain/models/rating.dart';

part 'company.freezed.dart';

part 'company.g.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    String name,
    String logoURL,
    List<DietOffer> availDiets,
    Rating rating,
    int priceLevel,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
