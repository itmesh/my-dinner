import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'client_dto.g.dart';

@JsonSerializable()
class ClientDto {
  final String email;
  final String name;
  final String surname;
  final String phoneNumber;

  ClientDto({
    this.email,
    this.name,
    this.surname,
    this.phoneNumber,
  });

  factory ClientDto.fromJson(Map<String, dynamic> json) =>
      _$ClientDtoFromJson(json);

  String toJson() => json.encode(_$ClientDtoToJson(this));
}
