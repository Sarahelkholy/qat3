import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class ProductPrice extends StatelessWidget {
  final String Currency,price;
  final int maxlines;
  final bool lineThrogh;
  final double size;
  final Color color;
  const ProductPrice({super.key, this.Currency='EGP ',required this.price,this.maxlines=1,this.lineThrogh=false,this.size=15,this.color=KDarkestColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      Currency + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style:TextStyle(color: color,fontSize: size).apply(decoration:lineThrogh? TextDecoration.lineThrough:null),

    );
  }
}
