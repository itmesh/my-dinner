// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$_$_CompanyFromJson(Map<String, dynamic> json) {
  return _$_Company(
    name: json['name'] as String,
    logoURL: json['logoURL'] as String,
    availDiets: (json['availDiets'] as List)
        ?.map((e) =>
            e == null ? null : DietOffer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rating: json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    priceLevel: json['priceLevel'] as int,
  );
}

Map<String, dynamic> _$_$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logoURL': instance.logoURL,
      'availDiets': instance.availDiets,
      'rating': instance.rating,
      'priceLevel': instance.priceLevel,
    };
