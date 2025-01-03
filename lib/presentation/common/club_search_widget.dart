import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClubSearchWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const ClubSearchWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });
  
  @override
  Widget build(BuildContext context) {
    return imageUrl.endsWith('.svg')
        ? SvgPicture.network(
            imageUrl,
            width: width,
            height: height,
            placeholderBuilder: (context) => const CircularProgressIndicator(),
          )
        : Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
  }
}