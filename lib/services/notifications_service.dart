import 'package:fleet_rrhh_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messegerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: AppTheme.color2,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ));
    messegerKey.currentState!.showSnackBar(snackBar);
  }
}
