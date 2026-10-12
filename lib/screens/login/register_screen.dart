import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginContainer1(
        child: LoginAreaForm(
          textTile: 'Registro',
          textButton: 'Registrar',
          pathButton: 'login',
          loginRegister: 2,
          textFinalButton: 'Tienes cuenta, ingresa',
          path: 'login',
        ),
      ),
    );
  }
}
