import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _userBody = '';
  static String _password = '';
  static bool _rememberme = true;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get userBody {
    return _prefs.getString('userBody') ?? _userBody;
  }

  static set userBody(String userBody) {
    _userBody = userBody;
    _prefs.setString('userBody', userBody);
  }

  static String get password {
    return _prefs.getString('password') ?? _password;
  }

  static set password(String password) {
    _password = password;
    _prefs.setString('password', password);
  }

  static bool get rememberme {
    return _prefs.getBool('rememberme') ?? _rememberme;
  }

  static set rememberme(bool rememberme) {
    _rememberme = rememberme;
    _prefs.setBool('rememberme', rememberme);
  }
}
