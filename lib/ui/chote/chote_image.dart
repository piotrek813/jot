import 'package:flutter/material.dart';

class ChoteImage extends StatelessWidget {
  const ChoteImage(
    this.image, {
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    super.key,
  });

  final String image;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
    );
  }
}
