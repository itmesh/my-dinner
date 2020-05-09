import 'package:my_dinner/features/pick_diet/data/dtos/vendor_offer_dto.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/features/pick_diet/domain/models/rating.dart';

class Company {
  final int id;
  final String name;
  final String logoURL;
  final List<DietOffer> availDiets;
  final Rating rating;
  final int priceLevel;
  final List<Payment> payments;

  Company({
    this.id,
    this.name,
    this.logoURL,
    this.availDiets,
    this.rating,
    this.priceLevel,
    this.payments,
  });

  factory Company.fromDto(VendorDto dto) {
    return Company(
      name: dto.name,
      logoURL: dto.logo,
      availDiets: dto.diets.map((e) => DietOffer.fromDto(e)).toList(),
      payments: dto.payments,
    );
  }
}
