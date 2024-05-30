import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerRectangle extends StatelessWidget {

  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final BorderRadius? borderRadius;

  const ShimmerRectangle({
    required this.width,
    required this.height,
    required this.baseColor,
    required this.highlightColor,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: borderRadius,
        ),
        
      ),
    );
  }
}