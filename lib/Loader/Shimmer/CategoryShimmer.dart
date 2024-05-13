import 'package:flutter/material.dart';
import 'package:qat3/Loader/Shimmer/ShimmerEffect.dart';

class CategoryShimmer extends StatelessWidget {
  final int itemCount;
  const CategoryShimmer({this.itemCount=6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: 16,),
              ShimmerEffect(width: 55, height: 8)
            ],
          );
          },
          separatorBuilder: (_,__)=>const SizedBox(width: 10,),
          itemCount: itemCount),
    );
  }
}
