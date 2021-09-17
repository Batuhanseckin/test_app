import 'package:shared_preferences/shared_preferences.dart';

enum PreferencesKeys {
  USER_ID,
  IS_LOGIN,
  THEME_MODE,
}

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();
  SharedPreferences _preferences;
  static LocaleManager get instance => _instance;
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static prefrencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> sharedClear() async {
    return instance._preferences.clear();
  }

  Future<bool> remove(PreferencesKeys preferencesKeys) async {
    return instance._preferences.remove(preferencesKeys.toString());
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await instance._preferences.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      instance._preferences.getString(key.toString()) ?? "";

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await instance._preferences.setBool(key.toString(), value);
  }

  bool getBoolValue(PreferencesKeys key) =>
      instance._preferences.getBool(key.toString()) ?? false;

  Future<void> setIntValue(PreferencesKeys key, int value) async {
    await instance._preferences.setInt(key.toString(), value);
  }

  int getIntValue(PreferencesKeys key) =>
      instance._preferences.getInt(key.toString()) ?? 0;
}
