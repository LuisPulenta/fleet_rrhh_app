import 'package:fleet_rrhh_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      required String counterText,
      IconData? prefixIcon,
      IconData? suffixIcon,
      Function? suffixIconFn}) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      counterText: counterText,
      prefixIcon:
          prefixIcon != null ? Icon(prefixIcon, color: AppTheme.color1) : null,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(suffixIcon, color: AppTheme.color1),
              onPressed: () => suffixIconFn!(),
            )
          : null,
    );
  }
}
