import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dinner/features/companies/domain/models/rating.dart';

part 'company.freezed.dart';

part 'company.g.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    String name,
    String logoURL,
    List<String> availDiets,
    Rating rating,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
