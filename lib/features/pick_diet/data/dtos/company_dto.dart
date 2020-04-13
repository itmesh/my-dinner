import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/diet_offer_dto.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/rating_dto.dart';

part 'company_dto.g.dart';

@JsonSerializable()
class CompanyDto {
  final String name;
  final String logoURL;
  final List<DietOfferDto> availDiets;
  final RatingDto rating;
  final int priceLevel;

  CompanyDto({
    this.name,
    this.logoURL,
    this.availDiets,
    this.rating,
    this.priceLevel,
  });

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);
}
