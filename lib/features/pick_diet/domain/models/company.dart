import 'package:my_dinner/features/pick_diet/data/dtos/company_dto.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/features/pick_diet/domain/models/rating.dart';

class Company {
  final String name;
  final String logoURL;
  final List<DietOffer> availDiets;
  final Rating rating;
  final int priceLevel;

  Company({
    this.name,
    this.logoURL,
    this.availDiets,
    this.rating,
    this.priceLevel,
  });

  factory Company.fromDto(CompanyDto dto) {
    return Company(
      name: dto.name,
      logoURL: dto.logoURL,
      availDiets: dto.availDiets.map((e) => DietOffer.fromDto(e)),
      rating: Rating.fromDto(dto.rating),
      priceLevel: dto.priceLevel,
    );
  }
}
