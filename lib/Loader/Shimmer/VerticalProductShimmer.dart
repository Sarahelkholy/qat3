import 'package:flutter/material.dart';
import 'package:qat3/Loader/Shimmer/ShimmerEffect.dart';
import 'package:qat3/widgets/GrideLayout.dart';
class VerticalProductShimmer extends StatelessWidget {
  final int itemCount;
  const VerticalProductShimmer({this.itemCount=4});

  @override
  Widget build(BuildContext context) {
    return GrideLayout(itemCount: itemCount, itemBuilder: (_,__)=>const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerEffect(width: 180, height: 180),
          SizedBox(height: 20,),
          ShimmerEffect(width: 160, height: 15),
          SizedBox(height: 10,),
          ShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
