// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return _Meal.fromJson(json);
}

mixin _$Meal {
  String get name;
  String get description;
  DateTime get servingDate;
  Diet get diet;

  Meal copyWith(
      {String name, String description, DateTime servingDate, Diet diet});

  Map<String, dynamic> toJson();
}

class _$MealTearOff {
  const _$MealTearOff();

  _Meal call(
      {String name, String description, DateTime servingDate, Diet diet}) {
    return _Meal(
      name: name,
      description: description,
      servingDate: servingDate,
      diet: diet,
    );
  }
}

const $Meal = _$MealTearOff();

@JsonSerializable()
class _$_Meal implements _Meal {
  const _$_Meal({this.name, this.description, this.servingDate, this.diet});

  factory _$_Meal.fromJson(Map<String, dynamic> json) =>
      _$_$_MealFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime servingDate;
  @override
  final Diet diet;

  @override
  String toString() {
    return 'Meal(name: $name, description: $description, servingDate: $servingDate, diet: $diet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Meal &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.servingDate, servingDate) ||
                const DeepCollectionEquality()
                    .equals(other.servingDate, servingDate)) &&
            (identical(other.diet, diet) ||
                const DeepCollectionEquality().equals(other.diet, diet)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(servingDate) ^
      const DeepCollectionEquality().hash(diet);

  @override
  _$_Meal copyWith({
    Object name = freezed,
    Object description = freezed,
    Object servingDate = freezed,
    Object diet = freezed,
  }) {
    return _$_Meal(
      name: name == freezed ? this.name : name as String,
      description:
          description == freezed ? this.description : description as String,
      servingDate:
          servingDate == freezed ? this.servingDate : servingDate as DateTime,
      diet: diet == freezed ? this.diet : diet as Diet,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MealToJson(this);
  }
}

abstract class _Meal implements Meal {
  const factory _Meal(
      {String name,
      String description,
      DateTime servingDate,
      Diet diet}) = _$_Meal;

  factory _Meal.fromJson(Map<String, dynamic> json) = _$_Meal.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get servingDate;
  @override
  Diet get diet;

  @override
  _Meal copyWith(
      {String name, String description, DateTime servingDate, Diet diet});
}
