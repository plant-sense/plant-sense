import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkLoadingImage extends StatelessWidget {
  final String? url;

  const NetworkLoadingImage({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    if (url == null || url == "") {
      return Container(color: Colors.green.shade300);
    }
    return Image.network(
      url!,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[200]!,
          child: Container(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
