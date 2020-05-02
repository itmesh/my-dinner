import 'package:either_option/either_option.dart';
import 'package:mobx/mobx.dart';

import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/get_profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/update_profile.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final GetProfile _getProfile;
  final UpdateProfile _updateProfile;

  _ProfileStore(this._getProfile, this._updateProfile);

  @observable
  ObservableFuture _profileFuture;

  @observable
  Profile profile;

  @observable
  bool error = false;

  @observable
  bool updateSuccess = false;

  @computed
  bool get loading =>
      _profileFuture != null && _profileFuture.status == FutureStatus.pending;

  @action
  Future<void> getProfile() async {
    error = false;
    _profileFuture = ObservableFuture(_getProfile(NoParams()));
    Either either = await _profileFuture;
    either.fold(
      (error) => this.error = true,
      (profile) => this.profile = profile,
    );
  }

  @action
  Future<void> updateProfile(Profile profile) async {
    error = false;
    updateSuccess = false;
    _profileFuture =
        ObservableFuture(_updateProfile(UpdateProfileParams(profile: profile)));
    Either either = await _profileFuture;
    either.fold(
      (error) => this.error = true,
      (profile) {
        this.profile = profile;
        updateSuccess = true;
      },
    );
  }
}
