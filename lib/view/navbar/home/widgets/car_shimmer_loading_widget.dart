import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CarShimmerLoadingWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  const CarShimmerLoadingWidget({super.key, required this.imageUrl, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height * 0.25,
      width: Get.width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: Get.height * 0.25,
            width: Get.width,
            color: Colors.white,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
