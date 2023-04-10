import 'package:fleet_rrhh_app/models/models.dart';
import 'package:flutter/material.dart';

class AppInfoProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _rememberme = true;
  bool _showLoader = false;
  bool _passwordShow = true;
  User? _usuario;

//---------------------------- isValidForm --------------------------
  bool isValidForm() {
    print(formKey.currentState?.validate());
    // print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }

//---------------------------- rememberme ------------------------------
  bool get rememberme {
    return _rememberme;
  }

  set rememberme(bool rememberme) {
    _rememberme = rememberme;
    notifyListeners();
  }

//---------------------------- showLoader ------------------------------
  bool get showLoader {
    return _showLoader;
  }

  set showLoader(bool showLoader) {
    _showLoader = showLoader;
    notifyListeners();
  }

  //---------------------------- passwordShow ------------------------------
  bool get passwordShow {
    return _passwordShow;
  }

  set passwordShow(bool passwordShow) {
    _passwordShow = passwordShow;
    notifyListeners();
  }

  //---------------------------- usuario ------------------------------
  User? get usuario {
    return _usuario;
  }

  set usuario(User? usuario) {
    _usuario = usuario;
    notifyListeners();
  }
}
