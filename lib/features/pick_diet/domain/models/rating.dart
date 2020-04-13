import 'package:my_dinner/features/pick_diet/data/dtos/rating_dto.dart';

class Rating {
  final double rate;
  final int votesCount;

  Rating({
    this.rate,
    this.votesCount,
  });

  factory Rating.fromDto(RatingDto dto) {
    return Rating(
      rate: dto.rate,
      votesCount: dto.votesCount,
    );
  }
}
