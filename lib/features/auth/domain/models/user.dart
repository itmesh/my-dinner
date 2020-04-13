import 'package:my_dinner/features/auth/data/dtos/user_dto.dart';

class User {
  final String email;
  final String password;

  User({
    this.email,
    this.password,
  });

  factory User.fromDto(UserDto dto) {
    return User(email: dto.email);
  }

  UserDto toDto() {
    return UserDto(
      email: email,
      password: password,
    );
  }
}
