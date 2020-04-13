import 'package:json_annotation/json_annotation.dart';

part 'diet_offer_dto.g.dart';

@JsonSerializable()
class DietOfferDto {
  final String name;
  final String description;
  final List<String> variants;
  final List<int> calorific;

  DietOfferDto({
    this.name,
    this.description,
    this.variants,
    this.calorific,
  });

  factory DietOfferDto.fromJson(Map<String, dynamic> json) =>
      _$DietOfferDtoFromJson(json);
}
