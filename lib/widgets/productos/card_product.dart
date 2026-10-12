import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../widgets.dart';

class CardProduct extends StatelessWidget {
  final Listado product;
  const CardProduct({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: double.infinity,
      decoration: _cardDecorations(),
      child: Column(
        children: [
          Stack(
            children: [
              ImageProduct(
                url: product.productImage,
                height: 190,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: PriceProduct(productPrice: product.productPrice),
              ),
            ],
          ),
          DetailProduct(
            productName: product.productName,
            productId: product.productId,
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecorations() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: const [
    BoxShadow(color: Colors.black12, offset: Offset(0, 6), blurRadius: 16),
  ],
);
