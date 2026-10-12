import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../providers/login_form_provider.dart';
import '../../services/auth_service.dart';
import '../../themes/my_theme.dart';
import '../../ui/input_decorations.dart';

class LoginForm extends StatelessWidget {
  final String textButton;
  final String pathButton;
  final int loginRegister;

  const LoginForm({
    super.key,
    required this.textButton,
    required this.pathButton,
    required this.loginRegister,
  });

  static String _traducirError(String code) {
    if (code.startsWith('INVALID_LOGIN_CREDENTIALS') ||
        code.startsWith('INVALID_PASSWORD') ||
        code.startsWith('EMAIL_NOT_FOUND')) {
      return 'Correo o contraseña incorrectos';
    }
    if (code.startsWith('EMAIL_EXISTS')) return 'El correo ya está registrado';
    if (code.startsWith('WEAK_PASSWORD')) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (code.startsWith('TOO_MANY_ATTEMPTS')) {
      return 'Demasiados intentos, inténtelo más tarde';
    }
    if (code == 'NETWORK_ERROR') return 'Error de conexión';
    return 'Error: $code';
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Ingrese su correo',
              labelText: 'Email',
              prefixIcon: Icons.alternate_email_rounded,
            ),
            onChanged: (value) => loginForm.email = value.trim(),
            validator: (value) {
              final regExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
              return (value != null && regExp.hasMatch(value.trim()))
                  ? null
                  : 'Ingrese un correo válido';
            },
          ),
          const SizedBox(height: 18),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
              hinText: '*********',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Debe tener al menos 6 caracteres';
            },
          ),
          const SizedBox(height: 28),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            disabledColor: Colors.grey,
            color: AppColors.primary,
            elevation: 0,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authService = Provider.of<AuthService>(
                      context,
                      listen: false,
                    );
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;

                    final String? errorMessage = loginRegister == 1
                        ? await authService.login(
                            loginForm.email,
                            loginForm.password,
                          )
                        : await authService.create(
                            loginForm.email,
                            loginForm.password,
                          );

                    if (!context.mounted) return;
                    loginForm.isLoading = false;

                    if (errorMessage == null) {
                      if (loginRegister == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cuenta creada, ahora inicie sesión'),
                          ),
                        );
                      }
                      Navigator.pushReplacementNamed(context, pathButton);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(_traducirError(errorMessage))),
                      );
                    }
                  },
            child: Text(
              loginForm.isLoading ? 'Espere...' : textButton,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
