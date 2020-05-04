import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/address/data/dtos/address_dto.dart';

part 'diet_dto.g.dart';

@JsonSerializable()
class DietSetDto {
  final int id;
  final String name;
  final int calories;
  final String vendorName;
  final AddressDto address;

  DietSetDto({
    this.id,
    this.name,
    this.calories,
    this.vendorName,
    this.address,
  });

  factory DietSetDto.fromJson(Map<String, dynamic> json) =>
      _$DietSetDtoFromJson(json);
}

@JsonSerializable()
class DietDayDto {
  final List<DietSetDto> scheduledSets;
  final List<DietSetDto> availableSets;

  DietDayDto({
    this.scheduledSets,
    this.availableSets,
  });

  factory DietDayDto.fromJson(Map<String, dynamic> json) =>
      _$DietDayDtoFromJson(json);
}