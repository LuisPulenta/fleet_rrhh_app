import 'package:fleet_rrhh_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Text('Bienvenido/a ' + appInfoProvider.usuarioLogueado),
      ),
    );
  }
}
