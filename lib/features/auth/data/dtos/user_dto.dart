import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String email;
  final String password;

  UserDto({
    this.email,
    this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  String toJson() => json.encode(_$UserDtoToJson(this));
}
