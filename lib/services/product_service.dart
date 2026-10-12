import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';
  static const Duration _timeout = Duration(seconds: 15);

  List<Listado> products = [];
  Listado? selectedProduct;
  bool isSaving = false;
  bool isLoading = true;
  String? errorMessage;

  ProductService() {
    loadProducts();
  }

  Map<String, String> get _headers => {
    'authorization': 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}',
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final url = Uri.http(_baseUrl, 'ejemplos/product_list_rest/');
      final response = await http.get(url, headers: _headers).timeout(_timeout);
      if (response.statusCode != 200) {
        throw Exception('HTTP ${response.statusCode}');
      }
      products = Product.fromJson(response.body).listado;
    } catch (e) {
      products = [];
      errorMessage = 'No se pudieron cargar los productos.\n$e';
      debugPrint(errorMessage);
    }
    isLoading = false;
    notifyListeners();
  }

  /// Devuelve true si la operación se realizó correctamente.
  Future<bool> editOrCreateProduct(Listado product) async {
    isSaving = true;
    notifyListeners();
    final bool ok = product.productId == 0
        ? await _createProduct(product)
        : await _updateProduct(product);
    isSaving = false;
    notifyListeners();
    return ok;
  }

  Future<bool> _post(String path, Listado product) async {
    try {
      final response = await http
          .post(
            Uri.http(_baseUrl, path),
            body: product.toJson(),
            headers: _headers,
          )
          .timeout(_timeout);
      debugPrint(response.body);
      return response.statusCode >= 200 && response.statusCode < 300;
    } catch (e) {
      debugPrint('Error en $path: $e');
      return false;
    }
  }

  Future<bool> _createProduct(Listado product) async {
    final ok = await _post('ejemplos/product_add_rest/', product);
    // Se recarga el listado para obtener el id real asignado por el servidor.
    if (ok) await loadProducts();
    return ok;
  }

  Future<bool> _updateProduct(Listado product) async {
    final ok = await _post('ejemplos/product_edit_rest/', product);
    if (ok) {
      final index = products.indexWhere(
        (element) => element.productId == product.productId,
      );
      if (index != -1) products[index] = product;
    }
    return ok;
  }

  Future<bool> deleteProduct(Listado product) async {
    // Un producto nuevo (id 0) aún no existe en el servidor.
    if (product.productId == 0) return true;
    isSaving = true;
    notifyListeners();
    final ok = await _post('ejemplos/product_del_rest/', product);
    if (ok) {
      products.removeWhere((element) => element.productId == product.productId);
    }
    isSaving = false;
    notifyListeners();
    return ok;
  }
}
