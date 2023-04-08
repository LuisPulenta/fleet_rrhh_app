import 'package:flutter/material.dart';

class AppInfoProvider with ChangeNotifier {
  String _usuarioLogueado = '';
  String _password = '';
  bool _rememberme = true;

  String get usuarioLogueado {
    return _usuarioLogueado;
  }

  set usuarioLogueado(String usuario) {
    _usuarioLogueado = usuario;
    notifyListeners();
  }

  String get password {
    return _password;
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  bool get rememberme {
    return _rememberme;
  }

  set rememberme(bool rememberme) {
    _rememberme = rememberme;
    notifyListeners();
  }
}
