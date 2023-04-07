import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//------------------------------------------------------------------
//------------------------- Variables ------------------------------
//------------------------------------------------------------------

//------------------------------------------------------------------
//------------------------- initState ------------------------------
//------------------------------------------------------------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//------------------------------------------------------------------
//------------------------- Pantalla -------------------------------
//------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('LoginScreen'),
      ),
    );
  }
}
