import 'package:flutter/material.dart';

/// Los colores de la app. Los dejé todos aquí para no repetirlos en cada widget.
class AppColors {
  static const Color primary = Color.fromRGBO(15, 118, 110, 1); // verde azulado
  static const Color primaryDark = Color.fromRGBO(19, 78, 74, 1);
  static const Color accent = Color.fromRGBO(245, 158, 11, 1); // ámbar
  static const Color background = Color.fromRGBO(241, 245, 249, 1);
  static const Color textDark = Color.fromRGBO(30, 41, 59, 1);
  static const Color textLight = Color.fromRGBO(100, 116, 139, 1);
  static const Color danger = Color.fromRGBO(225, 29, 72, 1);
}

class MyTheme {
  // se mantiene "primary" por compatibilidad con el código anterior
  static const Color primary = AppColors.primary;

  static final ThemeData myTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.accent,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.textDark,
    ),
  );
}
