import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  final String url;
  final double size;
  final BoxFit fit;

  const ImageAvatar({
    super.key,
    required this.url,
    this.size = 50.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
            shape: const CircleBorder(),
            image: DecorationImage(
              fit: fit,
              image: NetworkImage(url),
            )),
      ),
    );
  }
}
