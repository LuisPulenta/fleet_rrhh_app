import 'package:fleet_rrhh_app/screens/screens.dart';
import 'package:fleet_rrhh_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fleet RRHH',
      initialRoute: 'login',
      theme: AppTheme.lightTheme,
      routes: {
        'login': (_) => const LoginScreen(),
      },
    );
  }
}
