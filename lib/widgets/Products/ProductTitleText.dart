import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

class ProductTitleText extends StatelessWidget {
  final String title;
  final int maxlines;
  final FontWeight? weight;
  final double size;
  final TextAlign? textalign;
  final Color color;
  const ProductTitleText({super.key, required this.title,this.textalign=TextAlign.left,this.maxlines=2,required this.size,this.weight,this.color=KDarkestColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:TextStyle(color: color,fontWeight:weight,fontSize: size),
      overflow: TextOverflow.ellipsis,
      maxLines:maxlines,
      textAlign: textalign,
    );
  }
}
