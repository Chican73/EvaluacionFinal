import 'package:flutter/material.dart';

class Buble extends StatelessWidget {
  final double size;
  const Buble({super.key, this.size = 100});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
        color: const Color.fromRGBO(255, 255, 255, 0.08),
      ),
    );
  }
}
