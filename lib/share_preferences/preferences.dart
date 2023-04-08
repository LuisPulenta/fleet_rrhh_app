import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _usuario = '';
  static String _password = '';
  static bool _rememberme = true;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get usuario {
    return _prefs.getString('usuario') ?? _usuario;
  }

  static set usuario(String usuario) {
    _usuario = usuario;
    _prefs.setString('usuario', usuario);
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
