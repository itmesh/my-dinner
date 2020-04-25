import 'package:my_dinner/features/profile/data/dtos/client_dto.dart';

class Profile {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;

  Profile({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
  });

  factory Profile.fromDto(ClientDto dto) {
    return Profile(
      name: dto.name,
      surname: dto.surname,
      email: dto.email,
      phoneNumber: dto.phoneNumber,
    );
  }

  ClientDto toDto() {
    return ClientDto(
      name: name,
      surname: surname,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
