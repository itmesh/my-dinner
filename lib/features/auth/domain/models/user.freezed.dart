// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

mixin _$User {
  String get email;
  String get password;

  User copyWith({String email, String password});

  Map<String, dynamic> toJson();
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call({String email, String password}) {
    return _User(
      email: email,
      password: password,
    );
  }
}

const $User = _$UserTearOff();

@JsonSerializable()
class _$_User implements _User {
  const _$_User({this.email, this.password});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'User(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$_User copyWith({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _$_User(
      email: email == freezed ? this.email : email as String,
      password: password == freezed ? this.password : password as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({String email, String password}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get email;
  @override
  String get password;

  @override
  _User copyWith({String email, String password});
}
