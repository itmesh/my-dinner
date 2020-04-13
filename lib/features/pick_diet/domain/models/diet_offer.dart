import 'package:my_dinner/features/pick_diet/data/dtos/diet_offer_dto.dart';

class DietOffer {
  final String name;
  final String description;
  final List<String> variants;
  final List<int> calorific;

  DietOffer({
    this.name,
    this.description,
    this.variants,
    this.calorific,
  });

  factory DietOffer.fromDto(DietOfferDto dto) {
    return DietOffer(
      name: dto.name,
      description: dto.description,
      variants: dto.variants,
      calorific: dto.calorific,
    );
  }
}
