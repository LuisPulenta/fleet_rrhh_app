import 'package:fleet_rrhh_app/themes/themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
//---------------------------------------------------------------
//---------------------- Colores --------------------------------
//---------------------------------------------------------------

  static const Color color1 = Color.fromARGB(255, 7, 72, 144);
  static const Color color2 = Color.fromARGB(255, 241, 17, 14);
  static const Color color3 = Color.fromARGB(255, 113, 142, 176);
  static const Color color4 = Color.fromARGB(255, 11, 44, 91);
  static const Color color5 = Color.fromARGB(255, 87, 108, 139);
  static const Color color6 = Color.fromARGB(255, 9, 28, 62);
  static const Color color7 = Color.fromARGB(255, 107, 155, 205);
  static const Color color8 = Color.fromARGB(255, 130, 174, 215);

  static const Color primary = color1;
  static const Color secondary = color3;

//---------------------------------------------------------------
//---------------------- lightTheme -----------------------------
//---------------------------------------------------------------

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: "GloriaHallelujah-Regular",
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: "GloriaHallelujah-Regular",
        ),
    accentTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: "GloriaHallelujah-Regular",
        ),

    //Color primario
    primaryColor: primary,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      centerTitle: true,
    ),

    //TextButtonTheme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary),
    ),

    //FloatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    //ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        //shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),

    //InputDecorationTheme
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary, backgroundColor: secondary),
      labelStyle: TextStyle(color: AppTheme.color7),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.color1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.color1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.color3),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );
}
