import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Listado product;
  ProductFormProvider(this.product);

  // Antes la imagen no cambiaba al escribir otra URL porque no se
  // notificaba a la pantalla. Con esto la vista previa se actualiza.
  void actualizarImagen(String url) {
    product.productImage = url.trim();
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
