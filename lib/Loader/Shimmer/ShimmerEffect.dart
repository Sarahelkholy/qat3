import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width,height,radius;
  final Color? color;
  const ShimmerEffect({required this.width,required this.height,this.radius=15,this.color});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: KLightGray,
            borderRadius: BorderRadius.circular(radius)
          ),
        ),
        baseColor: KLightGray,
        highlightColor: Colors.white);
  }
}
