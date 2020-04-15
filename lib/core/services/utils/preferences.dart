import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_dinner/core/services/injection.dart';

abstract class PreferencesApi {
  Future<bool> setString(String key, String values);

  Future<String> getString(String key);

  Future<bool> setBool(String key, bool value);

  Future<bool> getBool(String key);

  Future<bool> remove(String key);
}

@RegisterAs(PreferencesApi)
@singleton
class Preferences implements PreferencesApi {
  @override
  Future<bool> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  @override
  Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getBool(key);
    } else {
      return null;
    }
  }

  @override
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getString(key);
    } else {
      return null;
    }
  }

  @override
  Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

@RegisterAs(PreferencesApi, env: Env.demo)
@singleton
class PreferencesDemo implements PreferencesApi {
  @override
  Future<bool> setBool(String key, bool values) async => true;

  @override
  Future<bool> getBool(String key) async => true;

  @override
  Future<String> getString(String key) async => null;

  @override
  Future<bool> setString(String key, String values) async => true;

  @override
  Future<bool> remove(String key) async => true;
}

class PreferencesKeys {
  static const bearerToken = 'bearerToken';
}
