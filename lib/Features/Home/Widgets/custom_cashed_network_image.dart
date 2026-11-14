import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  const CustomCashedNetworkImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
  });
  final String imagePath;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      height: height ?? 70,
      width: width ?? 125,
      
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade600,
        child: Container(
          height: height ?? 70,
          width: width ?? 125,
          color: AppColors.whiteTexts,
        ),
        
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
