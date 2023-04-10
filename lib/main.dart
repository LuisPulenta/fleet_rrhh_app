import 'dart:convert';

import 'package:fleet_rrhh_app/models/models.dart';
import 'package:fleet_rrhh_app/services/notifications_service.dart';
import 'package:fleet_rrhh_app/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fleet_rrhh_app/providers/providers.dart';
import 'package:fleet_rrhh_app/screens/screens.dart';
import 'package:fleet_rrhh_app/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppInfoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //------------------------------------------------------------------
  //------------------------- Variables ------------------------------
  //------------------------------------------------------------------

  bool _showLoginPage = true;
  bool _isLoading = true;

  //------------------------------------------------------------------
  //------------------------- initState ------------------------------
  //------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _getHome();
  }

  //------------------------------------------------------------------
  //------------------------- Pantalla -------------------------------
  //------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      debugShowCheckedModeBanner: false,
      title: 'Fleet RRHH',
      home: _isLoading
          ? const WaitScreen()
          : _showLoginPage
              ? LoginScreen()
              : const HomeScreen(),
      scaffoldMessengerKey: NotificationsService.messegerKey,
      theme: AppTheme.lightTheme,
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => const HomeScreen(),
        'wait': (_) => const WaitScreen(),
      },
    );
  }

  //------------------------------------------------------------------
  //------------------------- _getHome ------------------------------
  //------------------------------------------------------------------

  void _getHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final appInfoProvider =
        Provider.of<AppInfoProvider>(context, listen: false);

    bool isRemembered = prefs.getBool('rememberme') ?? false;

    if (isRemembered) {
      User usuario = User.fromJson(jsonDecode(prefs.getString('userBody')!));
      appInfoProvider.usuario = usuario;

      if (usuario.login != '' && usuario.contrasena != '') {
        _showLoginPage = false;
      } else {
        _showLoginPage = true;
      }
    }
    _isLoading = false;
    setState(() {});
  }
}
