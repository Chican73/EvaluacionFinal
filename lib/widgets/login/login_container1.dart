import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/my_theme.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class LoginContainer1 extends StatelessWidget {
  final Widget child;
  const LoginContainer1({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const LoginContainer2(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: const Column(
                children: [
                  Icon(Icons.storefront_outlined, color: Colors.white, size: 70),
                  Text(
                    'Mi Tiendita',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
