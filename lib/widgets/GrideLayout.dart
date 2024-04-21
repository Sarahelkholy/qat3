import 'package:flutter/material.dart';
class GrideLayout extends StatelessWidget {
  final int itemCount;
  final double? mainAxis;
  final Widget? Function(BuildContext,int) itemBuilder;
  const GrideLayout({super.key, required this.itemCount,required this.itemBuilder,this.mainAxis=288});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxis,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemBuilder: itemBuilder,
    );
  }
}
