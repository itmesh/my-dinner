// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    email: json['email'] as String,
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    surname: json['surname'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'surname': instance.surname,
    };
