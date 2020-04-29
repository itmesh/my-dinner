import 'package:json_annotation/json_annotation.dart';

part 'vendor_offer_dto.g.dart';

@JsonSerializable()
class VendorOfferDto {
  final OfferDto diet;

  VendorOfferDto(this.diet);

  factory VendorOfferDto.fromJson(Map<String, dynamic> json) =>
      _$VendorOfferDtoFromJson(json);
}

@JsonSerializable()
class OfferDto {
  final int id;
  final String name;
  final String description;
  final List<CalorificDto> calorificList;

  OfferDto(
    this.id,
    this.name,
    this.description,
    this.calorificList,
  );

  factory OfferDto.fromJson(Map<String, dynamic> json) =>
      _$OfferDtoFromJson(json);
}

@JsonSerializable()
class CalorificDto {
  final int id;
  final int value;
  final List<PriceDto> pricing;

  CalorificDto(
    this.id,
    this.value,
    this.pricing,
  );
  factory CalorificDto.fromJson(Map<String, dynamic> json) =>
      _$CalorificDtoFromJson(json);
}

@JsonSerializable()
class PriceDto {
  final double price;
  final double appliesUpTo;

  PriceDto(
    this.price,
    this.appliesUpTo,
  );
  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);
}
