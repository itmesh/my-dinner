import 'package:json_annotation/json_annotation.dart';

part 'diet_order_dto.g.dart';

@JsonSerializable()
class DietSetOrderDto {
  DietSetOrderDto();

  factory DietSetOrderDto.fromJson(Map<String, dynamic> json) =>
      _$DietSetOrderDtoFromJson(json);

}
