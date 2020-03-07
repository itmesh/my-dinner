// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'diet_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

DietOffer _$DietOfferFromJson(Map<String, dynamic> json) {
  return _DietOffer.fromJson(json);
}

mixin _$DietOffer {
  String get name;
  String get description;
  List<String> get variants;
  List<int> get calorific;

  DietOffer copyWith(
      {String name,
      String description,
      List<String> variants,
      List<int> calorific});

  Map<String, dynamic> toJson();
}

class _$DietOfferTearOff {
  const _$DietOfferTearOff();

  _DietOffer call(String name, String description, List<String> variants,
      List<int> calorific) {
    return _DietOffer(
      name,
      description,
      variants,
      calorific,
    );
  }
}

const $DietOffer = _$DietOfferTearOff();

@JsonSerializable()
class _$_DietOffer implements _DietOffer {
  const _$_DietOffer(this.name, this.description, this.variants, this.calorific)
      : assert(name != null),
        assert(description != null),
        assert(variants != null),
        assert(calorific != null);

  factory _$_DietOffer.fromJson(Map<String, dynamic> json) =>
      _$_$_DietOfferFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final List<String> variants;
  @override
  final List<int> calorific;

  @override
  String toString() {
    return 'DietOffer(name: $name, description: $description, variants: $variants, calorific: $calorific)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DietOffer &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.variants, variants) ||
                const DeepCollectionEquality()
                    .equals(other.variants, variants)) &&
            (identical(other.calorific, calorific) ||
                const DeepCollectionEquality()
                    .equals(other.calorific, calorific)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(variants) ^
      const DeepCollectionEquality().hash(calorific);

  @override
  _$_DietOffer copyWith({
    Object name = freezed,
    Object description = freezed,
    Object variants = freezed,
    Object calorific = freezed,
  }) {
    return _$_DietOffer(
      name == freezed ? this.name : name as String,
      description == freezed ? this.description : description as String,
      variants == freezed ? this.variants : variants as List<String>,
      calorific == freezed ? this.calorific : calorific as List<int>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DietOfferToJson(this);
  }
}

abstract class _DietOffer implements DietOffer {
  const factory _DietOffer(String name, String description,
      List<String> variants, List<int> calorific) = _$_DietOffer;

  factory _DietOffer.fromJson(Map<String, dynamic> json) =
      _$_DietOffer.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get variants;
  @override
  List<int> get calorific;

  @override
  _DietOffer copyWith(
      {String name,
      String description,
      List<String> variants,
      List<int> calorific});
}
