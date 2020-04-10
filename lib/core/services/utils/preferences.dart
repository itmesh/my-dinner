import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesAPI {
  Future<bool> setString(String key, String values);

  Future<String> getString(String key);

  Future<bool> setBool(String key, bool value);

  Future<bool> getBool(String key);
}

class Preferences implements PreferencesAPI {
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
}

class PreferencesDemo implements PreferencesAPI {
  @override
  Future<bool> setBool(String key, bool values) async => true;

  @override
  Future<bool> getBool(String key) async => true;

  @override
  Future<String> getString(String key) async => null;

  @override
  Future<bool> setString(String key, String values) async => true;
}

class PreferencesKeys {
  static const bearerToken = 'bearerToken';
}
