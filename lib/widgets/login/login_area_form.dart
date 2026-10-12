import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/login_form_provider.dart';
import 'package:flutter_application_1/themes/my_theme.dart';
import 'package:flutter_application_1/widgets/utiles/card_container.dart';
import 'package:flutter_application_1/widgets/login/login_form.dart';
import 'package:provider/provider.dart';

class LoginAreaForm extends StatelessWidget {
  final String textTile;
  final String textButton;
  final String pathButton;
  final int loginRegister;
  final String textFinalButton;
  final String path;

  const LoginAreaForm({
    super.key,
    required this.textTile,
    required this.textButton,
    required this.pathButton,
    required this.loginRegister,
    required this.textFinalButton,
    required this.path,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 180),
          CardContainer(
            child: Column(
              children: [
                Text(
                  textTile,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  loginRegister == 1
                      ? 'Ingresa tus datos para continuar'
                      : 'Crea tu cuenta para comenzar',
                  style: const TextStyle(color: AppColors.textLight),
                ),
                const SizedBox(height: 26),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: LoginForm(
                    textButton: textButton,
                    pathButton: pathButton,
                    loginRegister: loginRegister,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, path),
                  child: Text(textFinalButton),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
