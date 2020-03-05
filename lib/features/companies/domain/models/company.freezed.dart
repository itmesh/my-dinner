// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

mixin _$Company {
  String get name;
  String get logoURL;
  List<DietOffer> get availDiets;
  Rating get rating;
  int get priceLevel;

  Company copyWith(
      {String name,
      String logoURL,
      List<DietOffer> availDiets,
      Rating rating,
      int priceLevel});

  Map<String, dynamic> toJson();
}

class _$CompanyTearOff {
  const _$CompanyTearOff();

  _Company call(
      {String name,
      String logoURL,
      List<DietOffer> availDiets,
      Rating rating,
      int priceLevel}) {
    return _Company(
      name: name,
      logoURL: logoURL,
      availDiets: availDiets,
      rating: rating,
      priceLevel: priceLevel,
    );
  }
}

const $Company = _$CompanyTearOff();

@JsonSerializable()
class _$_Company implements _Company {
  const _$_Company(
      {this.name, this.logoURL, this.availDiets, this.rating, this.priceLevel});

  factory _$_Company.fromJson(Map<String, dynamic> json) =>
      _$_$_CompanyFromJson(json);

  @override
  final String name;
  @override
  final String logoURL;
  @override
  final List<DietOffer> availDiets;
  @override
  final Rating rating;
  @override
  final int priceLevel;

  @override
  String toString() {
    return 'Company(name: $name, logoURL: $logoURL, availDiets: $availDiets, rating: $rating, priceLevel: $priceLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Company &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.logoURL, logoURL) ||
                const DeepCollectionEquality()
                    .equals(other.logoURL, logoURL)) &&
            (identical(other.availDiets, availDiets) ||
                const DeepCollectionEquality()
                    .equals(other.availDiets, availDiets)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.priceLevel, priceLevel) ||
                const DeepCollectionEquality()
                    .equals(other.priceLevel, priceLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(logoURL) ^
      const DeepCollectionEquality().hash(availDiets) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(priceLevel);

  @override
  _$_Company copyWith({
    Object name = freezed,
    Object logoURL = freezed,
    Object availDiets = freezed,
    Object rating = freezed,
    Object priceLevel = freezed,
  }) {
    return _$_Company(
      name: name == freezed ? this.name : name as String,
      logoURL: logoURL == freezed ? this.logoURL : logoURL as String,
      availDiets: availDiets == freezed
          ? this.availDiets
          : availDiets as List<DietOffer>,
      rating: rating == freezed ? this.rating : rating as Rating,
      priceLevel: priceLevel == freezed ? this.priceLevel : priceLevel as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompanyToJson(this);
  }
}

abstract class _Company implements Company {
  const factory _Company(
      {String name,
      String logoURL,
      List<DietOffer> availDiets,
      Rating rating,
      int priceLevel}) = _$_Company;

  factory _Company.fromJson(Map<String, dynamic> json) = _$_Company.fromJson;

  @override
  String get name;
  @override
  String get logoURL;
  @override
  List<DietOffer> get availDiets;
  @override
  Rating get rating;
  @override
  int get priceLevel;

  @override
  _Company copyWith(
      {String name,
      String logoURL,
      List<DietOffer> availDiets,
      Rating rating,
      int priceLevel});
}
