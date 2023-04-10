import 'package:fleet_rrhh_app/providers/providers.dart';
import 'package:fleet_rrhh_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//------------------------------------------------------------------
//------------------------- Variables ------------------------------
//------------------------------------------------------------------

//------------------------------------------------------------------
//------------------------- initState ------------------------------
//------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

//------------------------------------------------------------------
//------------------------- Pantalla -------------------------------
//------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final appInfoProvider =
        Provider.of<AppInfoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fleet RRHH App'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Bienvenido/a ' + appInfoProvider.usuario!.fullName),
      ),
      drawer: _getMenu(),
    );
  }

//------------------------------------------------------------------
//------------------------- _getMenu -------------------------------
//------------------------------------------------------------------

  Widget _getMenu() {
    final appInfoProvider =
        Provider.of<AppInfoProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.color3,
              AppTheme.color7,
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.color1,
                    AppTheme.color3,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: size.width * 0.8,
                        height: size.height * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppTheme.color1, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Usuario: ",
                        style: (TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        appInfoProvider.usuario!.fullName,
                        style: (const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              tileColor: const Color(0xff8c8c94),
              title: const Text('Cerrar Sesión',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              onTap: () {
                _logOut();
              },
            ),
          ],
        ),
      ),
    );
  }

//------------------------------------------------------------------
//------------------------- _logOut --------------------------------
//------------------------------------------------------------------

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberme', false);
    await prefs.setString('usuario', '');
    await prefs.setString('password', '');
    Navigator.pushReplacementNamed(context, 'login');
  }
}
