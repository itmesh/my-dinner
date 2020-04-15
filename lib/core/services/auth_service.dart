import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/preferences.dart';

@singleton
class AuthService {
  Future<void> saveToken(String token) async {
    PreferencesApi preferences = locator.get();
    await preferences.setString(PreferencesKeys.bearerToken, token);
  }

  Future<String> getToken() async {
    PreferencesApi preferences = locator.get();
    return await preferences.getString(PreferencesKeys.bearerToken);
  }

  Future<bool> removeToken() async {
    PreferencesApi preferences = locator.get();
    return await preferences.remove(PreferencesKeys.bearerToken);
  }
}
