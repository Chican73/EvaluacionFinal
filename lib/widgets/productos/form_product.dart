import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/product_form_provider.dart';
import '../../themes/my_theme.dart';
import '../../ui/input_decorations.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 22),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: productForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productId == 0 ? 'Nuevo producto' : 'Editar producto',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: product.productName,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) => product.productName = value.trim(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre',
                  prefixIcon: Icons.inventory_2_outlined,
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                initialValue: product.productPrice == 0
                    ? ''
                    : product.productPrice.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) =>
                    product.productPrice = int.tryParse(value) ?? 0,
                validator: (value) {
                  final precio = int.tryParse(value ?? '');
                  if (precio == null || precio <= 0) {
                    return 'Ingrese un precio mayor a 0';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Ej: 12990',
                  labelText: 'Precio',
                  prefixIcon: Icons.attach_money_rounded,
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                initialValue: product.productImage,
                keyboardType: TextInputType.url,
                // se usa el provider para que la imagen de arriba se actualice
                onChanged: (value) => productForm.actualizarImagen(value),
                validator: (value) {
                  final url = value?.trim() ?? '';
                  if (url.isEmpty) return 'La url es obligatoria';
                  if (!url.startsWith('http')) {
                    return 'La url debe comenzar con http o https';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'https://...',
                  labelText: 'URL de la imagen',
                  prefixIcon: Icons.link_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _createDecoration() => const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(20)),
  boxShadow: [
    BoxShadow(color: Colors.black12, offset: Offset(0, 6), blurRadius: 16),
  ],
);
