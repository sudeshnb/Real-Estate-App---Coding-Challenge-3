import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proplink/src/core/animation/animation.dart';

class HttpsImage extends StatelessWidget {
  const HttpsImage({
    super.key,
    required this.imageBuilder,
    required this.placeholder,
    required this.imageUrl,
  });
  final Widget placeholder;
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>) imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Shimmer(child: placeholder),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
    );
  }
}
