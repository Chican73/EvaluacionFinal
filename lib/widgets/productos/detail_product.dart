import 'package:flutter/material.dart';

import '../../themes/my_theme.dart';

class DetailProduct extends StatelessWidget {
  final String productName;
  final int? productId;
  const DetailProduct({super.key, required this.productName, this.productId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 12, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName.isEmpty ? 'Sin nombre' : productName,
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (productId != null)
                  Text(
                    'Código #$productId',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                  ),
              ],
            ),
          ),
          const Icon(Icons.edit_outlined, color: AppColors.primary, size: 20),
        ],
      ),
    );
  }
}
