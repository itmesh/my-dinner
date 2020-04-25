import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/repositories/profile_repository.dart';

@singleton
class UpdateProfile extends UseCase<Profile, UpdateProfileParams> {
  final ProfileRepository profileRepository;

  UpdateProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(UpdateProfileParams params) async {
    return await profileRepository.updateProfile(params.profile);
  }
}

class UpdateProfileParams {
  final Profile profile;

  UpdateProfileParams({this.profile});
}
