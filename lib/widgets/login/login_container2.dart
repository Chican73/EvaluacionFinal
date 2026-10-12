import 'package:flutter/material.dart';

import '../../themes/my_theme.dart';
import '../widgets.dart';

class LoginContainer2 extends StatelessWidget {
  const LoginContainer2({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: sizeScreen.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      // ClipRRect para que las burbujas no se salgan de las esquinas redondeadas
      child: const ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: Stack(
          children: [
            Positioned(top: 90, left: 30, child: Buble(size: 70)),
            Positioned(top: -40, left: -30, child: Buble(size: 140)),
            Positioned(bottom: -30, left: 120, child: Buble()),
            Positioned(top: 120, right: 20, child: Buble(size: 80)),
            Positioned(top: 20, right: 80, child: Buble(size: 50)),
            Positioned(top: -50, right: -20, child: Buble(size: 120)),
          ],
        ),
      ),
    );
  }
}
