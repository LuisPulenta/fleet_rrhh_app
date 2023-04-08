import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? prefixicon;
  final IconData? suffixicon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.prefixicon,
    this.suffixicon,
    this.keyboardType,
    this.isPassword = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: isPassword,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) {
          return 'Este campo es requerido';
        }
        return value.length < 6 ? 'Mínimo 6 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: '',
        icon: icon == null ? null : Icon(icon),
        prefixIcon: prefixicon == null ? null : Icon(prefixicon),
        suffixIcon: suffixicon == null ? null : Icon(suffixicon),
      ),
    );
  }
}
