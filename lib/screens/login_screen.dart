import 'package:fleet_rrhh_app/helpers/api_helper.dart';
import 'package:fleet_rrhh_app/services/notifications_service.dart';
import 'package:fleet_rrhh_app/share_preferences/preferences.dart';
import 'package:fleet_rrhh_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleet_rrhh_app/components/loader_component.dart';
import 'package:fleet_rrhh_app/providers/providers.dart';
import 'package:fleet_rrhh_app/themes/themes.dart';
import 'package:fleet_rrhh_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  String _usuario = '';
  String _password = '';

  LoginScreen({Key? key}) : super(key: key);

//------------------------------------------------------------------
//------------------------- Pantalla -------------------------------
//------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final appInfoProvider = Provider.of<AppInfoProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
        child: Stack(
          children: [
            SingleChildScrollView(
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
                          key: appInfoProvider.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              TextFormField(
                                autocorrect: false,
                                initialValue: _usuario,
                                decoration:
                                    InputDecorations.authInputDecoration(
                                  hintText: 'Usuario',
                                  labelText: 'Usuario...',
                                  counterText: 'Mínimo 6 caracteres',
                                  prefixIcon: Icons.person,
                                ),
                                onChanged: (value) => _usuario = value,
                                validator: (value) {
                                  return _usuario == ''
                                      ? 'Ingrese Usuario'
                                      : _usuario.length < 6
                                          ? "Escribió sólo ${_usuario.length.toString()} caracteres"
                                          : null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                autocorrect: false,
                                initialValue: _password,
                                decoration:
                                    InputDecorations.authInputDecoration(
                                        hintText: 'Contraseña',
                                        labelText: 'Contraseña...',
                                        counterText: 'Mínimo 6 caracteres',
                                        prefixIcon: Icons.lock,
                                        suffixIcon: appInfoProvider.passwordShow
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        suffixIconFn: () =>
                                            appInfoProvider.passwordShow =
                                                !appInfoProvider.passwordShow),
                                obscureText: appInfoProvider.passwordShow,
                                onChanged: (value) => _password = value,
                                validator: (value) {
                                  return _password == ''
                                      ? 'Ingrese Contraseña'
                                      : _password.length < 6
                                          ? "Escribió sólo ${_password.length.toString()} caracteres"
                                          : null;
                                },
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              CheckboxListTile(
                                  title: const Text("Recordarme:"),
                                  activeColor: AppTheme.primary,
                                  value: appInfoProvider.rememberme,
                                  onChanged: (value) {
                                    appInfoProvider.rememberme = value!;
                                  }),
                              ElevatedButton(
                                  onPressed: appInfoProvider.showLoader
                                      ? null
                                      : () async {
                                          FocusScope.of(context)
                                              .unfocus(); //Oculta el teclado

                                          if (!appInfoProvider.isValidForm())
                                            return;

                                          appInfoProvider.showLoader = true;
                                          String resp = await ApiHelper().login(
                                              context, _usuario, _password);
                                          appInfoProvider.showLoader = false;

                                          if (resp != 'Login Ok') {
                                            NotificationsService.showSnackbar(
                                                resp);
                                          } else {
                                            Preferences.rememberme =
                                                appInfoProvider.rememberme;

                                            Navigator.pushReplacementNamed(
                                                context, 'home');
                                          }
                                        },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 15),
                                    child: Center(
                                      child: Text(
                                          appInfoProvider.showLoader
                                              ? 'Espere...'
                                              : 'Ingresar',
                                          style: const TextStyle(
                                              color: Colors.white)),
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
            appInfoProvider.showLoader
                ? const LoaderComponent(
                    text: 'Por favor espere...',
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
