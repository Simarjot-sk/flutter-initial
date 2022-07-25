import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._();

  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static final userId = SharedPrefValue<int>('user_id', prefs);
  static final isLoggedIn = SharedPrefValue<bool>('is_logged_in', prefs);
  static final onBoardingShown =
      SharedPrefValue<bool>('on_boarding_shown', prefs);
  static final authToken = SharedPrefValue<String>('auth_token', prefs);

  static void clear() {
    prefs.clear();
  }
}

class SharedPrefValue<T> {
  final String key;
  final SharedPreferences prefs;

  SharedPrefValue(this.key, this.prefs);

  void set(T value) {
    switch (T) {
      case int:
        prefs.setInt(key, value as int);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
    }
  }

  T? getSafe() {
    return prefs.get(key) as T?;
  }

  T getOrDefault(T def) {
    return getSafe() ?? def;
  }

  T get() {
    return getSafe() ?? _getDefaultValues();
  }

  T _getDefaultValues() {
    switch (T) {
      case int:
        return -1 as T;
      case String:
        return "" as T;
      case bool:
        return false as T;
      default:
        throw Exception('Unrecognized Type T');
    }
  }

  void clear() {
    prefs.remove(key);
  }
}
