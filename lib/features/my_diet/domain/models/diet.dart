import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_dto.dart';

class DietSet {
  final int id;
  final String name;
  final int calories;
  final String vendorName;
  final Address address;

  DietSet({
    this.id,
    this.name,
    this.calories,
    this.vendorName,
    this.address,
  });

  factory DietSet.fromDto(DietSetDto dto) {
    return DietSet(
      id: dto.id,
      name: dto.name,
      calories: dto.calories,
      vendorName: dto.vendorName,
      address: dto.address == null ? null : Address.fromDto(dto.address),
    );
  }
}

class DietDay {
  final List<DietSet> scheduledSets;
  final List<DietSet> availableSets;

  DietDay({
    this.scheduledSets,
    this.availableSets,
  });

  factory DietDay.fromDto(DietDayDto dto) {
    return DietDay(
      scheduledSets: dto.scheduledSets.map((e) => DietSet.fromDto(e)).toList(),
      availableSets: dto.availableSets.map((e) => DietSet.fromDto(e)).toList(),
    );
  }

  get isEmpty => scheduledSets.isEmpty && availableSets.isEmpty;
}
