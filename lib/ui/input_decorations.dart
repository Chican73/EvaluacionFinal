import 'package:flutter/material.dart';

import '../themes/my_theme.dart';

class InputDecorations {
  static OutlineInputBorder _borde(Color color, [double ancho = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: ancho),
    );
  }

  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(248, 250, 252, 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: _borde(const Color.fromRGBO(226, 232, 240, 1)),
      focusedBorder: _borde(AppColors.primary, 2),
      errorBorder: _borde(AppColors.danger),
      focusedErrorBorder: _borde(AppColors.danger, 2),
      hintText: hinText,
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.textLight),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: AppColors.primary)
          : null,
    );
  }
}
