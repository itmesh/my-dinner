import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();

  Future<Either<Failure, Profile>> updateProfile(Profile profile);
}
