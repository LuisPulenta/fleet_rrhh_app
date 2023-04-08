import 'package:fleet_rrhh_app/providers/providers.dart';
import 'package:fleet_rrhh_app/share_preferences/preferences.dart';
import 'package:fleet_rrhh_app/themes/app_theme.dart';
import 'package:fleet_rrhh_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//------------------------------------------------------------------
//------------------------- Variables ------------------------------
//------------------------------------------------------------------

  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  final Map<String, String> formValues = {
    'usuario': '',
    'password': '',
  };

  bool _rememberme = true;
  bool _passwordShow = false;

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
    final loginForm = Provider.of<LoginFormProvider>(context);
    final appInfoProvider = Provider.of<AppInfoProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              CardContainer(
                child: Column(
                  children: [
                    const Text('Login',
                        style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: loginForm.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          CustomInputField(
                            prefixIcon: Icons.person,
                            labelText: "Usuario...",
                            hintText: "Usuario",
                            formProperty: 'usuario',
                            formValues: formValues,
                            counterText: 'Mínimo 6 caracteres',
                            validatorText:
                                "Escribió sólo ${formValues["usuario"]!.length.toString()} caracteres",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomInputField(
                            prefixIcon: Icons.lock,
                            suffixIcon: _passwordShow
                                ? Icons.visibility
                                : Icons.visibility_off,
                            isPassword: !_passwordShow,
                            labelText: "Contraseña...",
                            hintText: "Contraseña",
                            formProperty: 'password',
                            formValues: formValues,
                            counterText: 'Mínimo 6 caracteres',
                            validatorText:
                                "Escribió sólo ${formValues["password"]!.length.toString()} caracteres",
                            suffixIconFn: setPasswordShow,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          CheckboxListTile(
                              title: const Text("Recordarme:"),
                              activeColor: AppTheme.primary,
                              value: _rememberme,
                              onChanged: (value) {
                                _rememberme = value!;
                                setState(() {});
                              }),
                          ElevatedButton(
                              onPressed: loginForm.isLoading
                                  ? null
                                  : () async {
                                      FocusScope.of(context)
                                          .unfocus(); //Oculta el teclado

                                      if (!loginForm.isValidForm()) return;

                                      loginForm.isLoading = true;

                                      await Future.delayed(
                                          const Duration(seconds: 3));

                                      // TODO: validar si el Login es correcto
                                      loginForm.isLoading = false;

                                      appInfoProvider.usuarioLogueado =
                                          formValues["usuario"]!;
                                      appInfoProvider.password =
                                          formValues["password"]!;

                                      appInfoProvider.rememberme = _rememberme;

                                      formValues["password"]!;
                                      if (_rememberme) {
                                        Preferences.usuario =
                                            formValues["usuario"]!;
                                        Preferences.password =
                                            formValues["password"]!;
                                        Preferences.rememberme = _rememberme;
                                      } else {
                                        Preferences.usuario = "";
                                        Preferences.password = "";
                                        Preferences.rememberme = _rememberme;
                                      }
                                      Navigator.pushReplacementNamed(
                                          context, 'home');
                                    },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 15),
                                child: Center(
                                  child: Text(
                                      loginForm.isLoading
                                          ? 'Espere...'
                                          : 'Ingresar',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //------------------------ Método increase -------------------------
  void setPasswordShow() {
    _passwordShow = !_passwordShow;
    setState(() {});
  }
}
