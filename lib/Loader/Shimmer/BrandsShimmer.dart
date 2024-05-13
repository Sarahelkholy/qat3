import 'package:flutter/material.dart';
import 'package:qat3/Loader/Shimmer/ShimmerEffect.dart';
import 'package:qat3/widgets/GrideLayout.dart';

class BrandsShimmer extends StatelessWidget {
  final int itemCount;
  const BrandsShimmer({this.itemCount=4});

  @override
  Widget build(BuildContext context) {
    return GrideLayout(itemCount: itemCount,
        mainAxis: 80,
        itemBuilder: (_,__)=>const ShimmerEffect(width: 300, height: 80));
  }
}
