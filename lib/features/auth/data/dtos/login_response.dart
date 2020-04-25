import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String token;
  final String email;
  final String name;
  final String phoneNumber;
  final String surname;

  LoginResponse({
    this.email,
    this.name,
    this.phoneNumber,
    this.surname,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
