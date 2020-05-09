import 'package:my_dinner/features/pick_diet/data/dtos/diet_offer_dto.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/vendor_offer_dto.dart';

class DietOffer {
  final String name;
  final String description;
  final List<Calorie> calories;

  DietOffer({
    this.name,
    this.description,
    this.calories,
  });

  factory DietOffer.fromDto(OfferDto offer) => DietOffer(
        name: offer.name,
        description: offer.description,
        calories: offer.calorificList?.map((e) => Calorie.fromDto(e))?.toList(),
      );
}

class Calorie {
  final int id;
  final int value;
  final List<Price> pricing;

  Calorie({
    this.id,
    this.value,
    this.pricing,
  });

  factory Calorie.fromDto(CalorificDto dto) => Calorie(
        id: dto.id,
        value: dto.value,
        pricing: dto.pricing.map((e) => Price.fromDto(e)).toList(),
      );
}

class Price {
  final double value;
  final double appliesUpTo;

  Price({
    this.value,
    this.appliesUpTo,
  });

  factory Price.fromDto(PriceDto dto) => Price(
        value: dto.price,
        appliesUpTo: dto.appliesUpTo,
      );
}
