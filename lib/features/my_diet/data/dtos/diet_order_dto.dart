import 'package:json_annotation/json_annotation.dart';

part 'diet_order_dto.g.dart';

@JsonSerializable()
class DietOrderDto {
  final String name;

  DietOrderDto({
    this.name,
  });

  factory DietOrderDto.fromJson(Map<String, dynamic> json) =>
      _$DietOrderDtoFromJson(json);
}
