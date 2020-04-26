import 'package:equatable/equatable.dart';
import 'package:my_dinner/features/profile/data/dtos/client_dto.dart';

class Profile extends Equatable {
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;

  Profile({
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

  @override
  List<Object> get props => [
        this.name,
        this.surname,
        this.email,
        this.phoneNumber,
      ];
}
