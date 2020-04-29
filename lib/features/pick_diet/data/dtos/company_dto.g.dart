// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDto _$CompanyDtoFromJson(Map<String, dynamic> json) {
  return CompanyDto(
    name: json['name'] as String,
    logoURL: json['logoURL'] as String,
    availDiets: (json['availDiets'] as List)
        ?.map((e) =>
            e == null ? null : OfferDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rating: json['rating'] == null
        ? null
        : RatingDto.fromJson(json['rating'] as Map<String, dynamic>),
    priceLevel: json['priceLevel'] as int,
  );
}

Map<String, dynamic> _$CompanyDtoToJson(CompanyDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logoURL': instance.logoURL,
      'availDiets': instance.availDiets,
      'rating': instance.rating,
      'priceLevel': instance.priceLevel,
    };
