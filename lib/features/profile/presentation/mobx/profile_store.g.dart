// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading =>
      (_$loadingComputed ??= Computed<bool>(() => super.loading)).value;

  final _$_profileFutureAtom = Atom(name: '_ProfileStore._profileFuture');

  @override
  ObservableFuture<dynamic> get _profileFuture {
    _$_profileFutureAtom.context.enforceReadPolicy(_$_profileFutureAtom);
    _$_profileFutureAtom.reportObserved();
    return super._profileFuture;
  }

  @override
  set _profileFuture(ObservableFuture<dynamic> value) {
    _$_profileFutureAtom.context.conditionallyRunInAction(() {
      super._profileFuture = value;
      _$_profileFutureAtom.reportChanged();
    }, _$_profileFutureAtom, name: '${_$_profileFutureAtom.name}_set');
  }

  final _$profileAtom = Atom(name: '_ProfileStore.profile');

  @override
  Profile get profile {
    _$profileAtom.context.enforceReadPolicy(_$profileAtom);
    _$profileAtom.reportObserved();
    return super.profile;
  }

  @override
  set profile(Profile value) {
    _$profileAtom.context.conditionallyRunInAction(() {
      super.profile = value;
      _$profileAtom.reportChanged();
    }, _$profileAtom, name: '${_$profileAtom.name}_set');
  }

  final _$errorAtom = Atom(name: '_ProfileStore.error');

  @override
  bool get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$updateSuccessAtom = Atom(name: '_ProfileStore.updateSuccess');

  @override
  bool get updateSuccess {
    _$updateSuccessAtom.context.enforceReadPolicy(_$updateSuccessAtom);
    _$updateSuccessAtom.reportObserved();
    return super.updateSuccess;
  }

  @override
  set updateSuccess(bool value) {
    _$updateSuccessAtom.context.conditionallyRunInAction(() {
      super.updateSuccess = value;
      _$updateSuccessAtom.reportChanged();
    }, _$updateSuccessAtom, name: '${_$updateSuccessAtom.name}_set');
  }

  final _$getProfileAsyncAction = AsyncAction('getProfile');

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$updateProfileAsyncAction = AsyncAction('updateProfile');

  @override
  Future<void> updateProfile(Profile profile) {
    return _$updateProfileAsyncAction.run(() => super.updateProfile(profile));
  }

  @override
  String toString() {
    final string =
        'profile: ${profile.toString()},error: ${error.toString()},updateSuccess: ${updateSuccess.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
