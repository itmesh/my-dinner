import 'dart:math';

import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/profile/data/datasource/profile_api.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/repositories/profile_repository.dart';

@singleton
@RegisterAs(ProfileRepository)
class ProfileRepositoryImp extends ProfileRepository {
  final _log = Log('ProfileRepositoryImp');
  final ProfileApi profileApi;

  ProfileRepositoryImp(this.profileApi);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      Profile profile = Profile.fromDto(await profileApi.getProfile());
      return Right(profile);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    try {
      await profileApi.updateProfile(profile.toDto());
      return Right(profile);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }
}
