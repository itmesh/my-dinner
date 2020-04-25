import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/repositories/profile_repository.dart';

@singleton
class GetProfile extends UseCase<Profile, NoParams> {
  final ProfileRepository profileRepository;

  GetProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await profileRepository.getProfile();
  }
}
