import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_offer.freezed.dart';

part 'diet_offer.g.dart';

@freezed
abstract class DietOffer with _$DietOffer{
  const factory DietOffer(
    String name,
    String description,
    List<String> variants,
    List<int> calorific,
  ) = _DietOffer;

  factory DietOffer.fromJson(Map<String, dynamic> json) =>
      _$DietOfferFromJson(json);
}
