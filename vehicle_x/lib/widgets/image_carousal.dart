import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;
  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (_, i) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(images[i], fit: BoxFit.cover),
        ),
      ),
    );
  }
}
