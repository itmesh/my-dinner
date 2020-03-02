// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'diet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Diet _$DietFromJson(Map<String, dynamic> json) {
  return _Diet.fromJson(json);
}

mixin _$Diet {
  String get name;
  int get calories;
  int get dietCounts;
  Address get address;
  String get remarks;
  List<Meal> get meals;

  Diet copyWith(
      {String name,
      int calories,
      int dietCounts,
      Address address,
      String remarks,
      List<Meal> meals});

  Map<String, dynamic> toJson();
}

class _$DietTearOff {
  const _$DietTearOff();

  _Diet call(
      {String name,
      int calories,
      int dietCounts,
      Address address,
      String remarks,
      List<Meal> meals}) {
    return _Diet(
      name: name,
      calories: calories,
      dietCounts: dietCounts,
      address: address,
      remarks: remarks,
      meals: meals,
    );
  }
}

const $Diet = _$DietTearOff();

@JsonSerializable()
class _$_Diet implements _Diet {
  const _$_Diet(
      {this.name,
      this.calories,
      this.dietCounts,
      this.address,
      this.remarks,
      this.meals});

  factory _$_Diet.fromJson(Map<String, dynamic> json) =>
      _$_$_DietFromJson(json);

  @override
  final String name;
  @override
  final int calories;
  @override
  final int dietCounts;
  @override
  final Address address;
  @override
  final String remarks;
  @override
  final List<Meal> meals;

  @override
  String toString() {
    return 'Diet(name: $name, calories: $calories, dietCounts: $dietCounts, address: $address, remarks: $remarks, meals: $meals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Diet &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.calories, calories) ||
                const DeepCollectionEquality()
                    .equals(other.calories, calories)) &&
            (identical(other.dietCounts, dietCounts) ||
                const DeepCollectionEquality()
                    .equals(other.dietCounts, dietCounts)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.meals, meals) ||
                const DeepCollectionEquality().equals(other.meals, meals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(calories) ^
      const DeepCollectionEquality().hash(dietCounts) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(meals);

  @override
  _$_Diet copyWith({
    Object name = freezed,
    Object calories = freezed,
    Object dietCounts = freezed,
    Object address = freezed,
    Object remarks = freezed,
    Object meals = freezed,
  }) {
    return _$_Diet(
      name: name == freezed ? this.name : name as String,
      calories: calories == freezed ? this.calories : calories as int,
      dietCounts: dietCounts == freezed ? this.dietCounts : dietCounts as int,
      address: address == freezed ? this.address : address as Address,
      remarks: remarks == freezed ? this.remarks : remarks as String,
      meals: meals == freezed ? this.meals : meals as List<Meal>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DietToJson(this);
  }
}

abstract class _Diet implements Diet {
  const factory _Diet(
      {String name,
      int calories,
      int dietCounts,
      Address address,
      String remarks,
      List<Meal> meals}) = _$_Diet;

  factory _Diet.fromJson(Map<String, dynamic> json) = _$_Diet.fromJson;

  @override
  String get name;
  @override
  int get calories;
  @override
  int get dietCounts;
  @override
  Address get address;
  @override
  String get remarks;
  @override
  List<Meal> get meals;

  @override
  _Diet copyWith(
      {String name,
      int calories,
      int dietCounts,
      Address address,
      String remarks,
      List<Meal> meals});
}
