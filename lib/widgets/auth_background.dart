import 'package:fleet_rrhh_app/themes/themes.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _PurpleBox(),
          const _HeaderImage(),
          child,
        ],
      ),
    );
  }
}

//--------------------------------------------------------------
//------------------------ HeaderImage --------------------------
//--------------------------------------------------------------

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    Key? key,
  }) : super(key: key);

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

//--------------------------------------------------------------
//------------------------ _PurpleBox --------------------------
//--------------------------------------------------------------

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 1,
      decoration: _background(),
      child: Stack(
        children: [
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: -10,
            left: -20,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 20,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 50,
            right: 50,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -30,
            right: 160,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 90,
            left: 120,
          ),
          Positioned(
            child: _Bubble(),
            bottom: size.height * 0.4,
            left: -40,
          ),
          Positioned(
            child: _Bubble(),
            bottom: size.height * 0.6,
            right: -50,
          ),
          Positioned(
            child: _Bubble(),
            bottom: size.height * 0.3,
            right: -30,
          ),
          Positioned(
            child: _Bubble(),
            bottom: size.height * 0.7,
            right: size.width * 0.5,
          ),
        ],
      ),
    );
  }

//---------------------------------------------------------
//------------------- _background -------------------------
//---------------------------------------------------------
  BoxDecoration _background() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        AppTheme.primary,
        AppTheme.secondary,
      ]));
}

//--------------------------------------------------------------
//------------------------ _Bubble -----------------------------
//--------------------------------------------------------------
class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeCircle = 80;
    return Container(
      width: sizeCircle,
      height: sizeCircle,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizeCircle),
        color: AppTheme.color5,
      ),
    );
  }
}
