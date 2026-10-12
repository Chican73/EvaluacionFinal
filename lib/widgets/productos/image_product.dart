import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String? url;
  final double height;
  final BorderRadius borderRadius;
  const ImageProduct({
    super.key,
    this.url,
    this.height = 220,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  static const _noImage = Image(
    image: AssetImage('lib/assets/no-image.png'),
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    final hasUrl = url != null && url!.trim().isNotEmpty;
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: !hasUrl
            ? _noImage
            : FadeInImage(
                placeholder: const AssetImage('lib/assets/jar-loading.gif'),
                image: NetworkImage(url!.trim()),
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) => _noImage,
              ),
      ),
    );
  }
}
