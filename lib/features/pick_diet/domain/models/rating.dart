import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

part 'rating.g.dart';

@freezed
abstract class Rating with _$Rating {
  const factory Rating(
    double rate,
    int votesCount,
  ) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
