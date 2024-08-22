import 'dart:io';

import 'package:firebase_cached_image/firebase_cached_image.dart';
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
    final localImage = File(image);

    final ImageProvider imageProvider;

    if (localImage.existsSync()) {
      imageProvider = FileImage(localImage);
    } else {
      imageProvider = FirebaseImageProvider(
        FirebaseUrl(image),
      );
    }

    return Image(
      image: imageProvider,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // [ImageNotFoundException] will be thrown if image does not exist on server.
        if (error is ImageNotFoundException) {
          return const Text('Image not found on Cloud Storage.');
        } else {
          return Text('Error loading image: $error');
        }
      },
      width: width,
      height: height,
      alignment: alignment,
    );
  }
}
