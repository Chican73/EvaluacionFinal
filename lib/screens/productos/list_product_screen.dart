import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../services/service.dart';
import '../../themes/my_theme.dart';
import '../../widgets/widgets.dart';
import '../loading_screen.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return const LoadingScreen();

    final productos = productService.products;
    final hayError = productService.errorMessage != null && productos.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            tooltip: 'Recargar',
            onPressed: () => productService.loadProducts(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: hayError
          ? _MensajeVacio(
              icono: Icons.wifi_off_rounded,
              texto: productService.errorMessage!,
              onReintentar: () => productService.loadProducts(),
            )
          : productos.isEmpty
          ? _MensajeVacio(
              icono: Icons.inventory_2_outlined,
              texto: 'Aún no hay productos.\nPresiona + para agregar uno.',
              onReintentar: () => productService.loadProducts(),
            )
          // deslizar hacia abajo para recargar la lista
          : RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () => productService.loadProducts(),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 90),
                itemCount: productos.length + 1,
                itemBuilder: (BuildContext context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 4),
                      child: Text(
                        '${productos.length} productos registrados',
                        style: const TextStyle(color: AppColors.textLight),
                      ),
                    );
                  }
                  final producto = productos[index - 1];
                  return GestureDetector(
                    onTap: () {
                      productService.selectedProduct = producto.copy();
                      Navigator.pushNamed(context, 'edit_product');
                    },
                    child: CardProduct(product: producto),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Agregar producto',
        child: const Icon(Icons.add_rounded, size: 30),
        onPressed: () {
          productService.selectedProduct = Listado(
            productId: 0,
            productName: '',
            productPrice: 0,
            productImage: '',
            productState: '',
          );
          Navigator.pushNamed(context, 'edit_product');
        },
      ),
    );
  }
}

/// Mensaje centrado para cuando no hay datos o hubo un error.
class _MensajeVacio extends StatelessWidget {
  final IconData icono;
  final String texto;
  final VoidCallback onReintentar;
  const _MensajeVacio({
    required this.icono,
    required this.texto,
    required this.onReintentar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 70, color: AppColors.textLight),
            const SizedBox(height: 16),
            Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textDark),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onReintentar,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}
