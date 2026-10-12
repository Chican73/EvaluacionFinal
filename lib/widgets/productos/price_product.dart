import 'package:flutter/material.dart';

import '../../helpers/formato_precio.dart';
import '../../themes/my_theme.dart';

class PriceProduct extends StatelessWidget {
  final int productPrice;
  const PriceProduct({super.key, required this.productPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: _boxDecorations(),
      child: Text(
        formatearPrecio(productPrice),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  BoxDecoration _boxDecorations() {
    return BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
      ],
    );
  }
}
