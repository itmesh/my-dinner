// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDto _$ClientDtoFromJson(Map<String, dynamic> json) {
  return ClientDto(
    email: json['email'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$ClientDtoToJson(ClientDto instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
    };
