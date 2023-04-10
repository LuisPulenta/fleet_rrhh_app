import 'package:fleet_rrhh_app/themes/themes.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: size.width * 0.9,
            height: size.height * 0.17,
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
    );
  }
}
