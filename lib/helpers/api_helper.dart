import 'dart:convert';
import 'package:fleet_rrhh_app/models/models.dart';
import 'package:fleet_rrhh_app/providers/providers.dart';
import 'package:fleet_rrhh_app/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'constants.dart';

class ApiHelper {
//---------------------------------------------------------------------------
  static Future<Response> post(
      String controller, Map<String, dynamic> request) async {
    var url = Uri.parse('${Constants.apiUrl}$controller');
    var response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(request),
    );

    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: response.body);
    }

    return Response(isSuccess: true);
  }

//---------------------------------------------------------------------------
  static Future<Response> put(
      String controller, String id, Map<String, dynamic> request) async {
    var url = Uri.parse('${Constants.apiUrl}$controller$id');
    var response = await http.put(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(request),
    );

    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: response.body);
    }

    return Response(isSuccess: true);
  }

//---------------------------------------------------------------------------
  static Future<Response> delete(String controller, String id) async {
    var url = Uri.parse('${Constants.apiUrl}$controller$id');
    var response = await http.delete(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: response.body);
    }

    return Response(isSuccess: true);
  }

//---------------------------------------------------------------------------
  Future<String> login(
      BuildContext context, String usuario, String password) async {
    final Map<String, dynamic> request = {
      'Email': usuario,
      'password': password,
    };

    var url = Uri.parse('${Constants.apiUrl}/Api/Account/GetUserByEmail');
    var response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(request),
    );

    if (response.statusCode >= 400) {
      return 'Email o contraseña incorrectos';
    }

    var body = response.body;
    var decodedJson = jsonDecode(body);
    var user = User.fromJson(decodedJson);

    if (user.contrasena.toLowerCase() != password.toLowerCase()) {
      return 'Email o contraseña incorrectos';
    }

    if (user.habilitaAPP != 1) {
      return 'Usuario no habilitado';
    }

    final appInfoProvider =
        Provider.of<AppInfoProvider>(context, listen: false);

    appInfoProvider.usuario = user;

    if (appInfoProvider.rememberme) {
      Preferences.userBody = body;
    } else {
      Preferences.userBody = '';
    }
    return 'Login Ok';
  }
}
