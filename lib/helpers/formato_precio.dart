/// Da formato de peso chileno a un número entero.
/// Ej: 12990 -> "$12.990"
String formatearPrecio(int precio) {
  final texto = precio.abs().toString();
  final buffer = StringBuffer();
  for (int i = 0; i < texto.length; i++) {
    // cada 3 dígitos (contando desde la derecha) se agrega un punto
    if (i > 0 && (texto.length - i) % 3 == 0) buffer.write('.');
    buffer.write(texto[i]);
  }
  return '${precio < 0 ? '-' : ''}\$$buffer';
}
