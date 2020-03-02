// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

mixin _$Rating {
  double get rate;
  int get votesCount;

  Rating copyWith({double rate, int votesCount});

  Map<String, dynamic> toJson();
}

class _$RatingTearOff {
  const _$RatingTearOff();

  _Rating call(double rate, int votesCount) {
    return _Rating(
      rate,
      votesCount,
    );
  }
}

const $Rating = _$RatingTearOff();

@JsonSerializable()
class _$_Rating implements _Rating {
  const _$_Rating(this.rate, this.votesCount)
      : assert(rate != null),
        assert(votesCount != null);

  factory _$_Rating.fromJson(Map<String, dynamic> json) =>
      _$_$_RatingFromJson(json);

  @override
  final double rate;
  @override
  final int votesCount;

  @override
  String toString() {
    return 'Rating(rate: $rate, votesCount: $votesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Rating &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.votesCount, votesCount) ||
                const DeepCollectionEquality()
                    .equals(other.votesCount, votesCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(votesCount);

  @override
  _$_Rating copyWith({
    Object rate = freezed,
    Object votesCount = freezed,
  }) {
    return _$_Rating(
      rate == freezed ? this.rate : rate as double,
      votesCount == freezed ? this.votesCount : votesCount as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RatingToJson(this);
  }
}

abstract class _Rating implements Rating {
  const factory _Rating(double rate, int votesCount) = _$_Rating;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$_Rating.fromJson;

  @override
  double get rate;
  @override
  int get votesCount;

  @override
  _Rating copyWith({double rate, int votesCount});
}
