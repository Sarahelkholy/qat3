import 'package:flutter/material.dart';
import 'package:qat3/widgets/Products/ProductTitleText.dart';

import '../../constants.dart';
class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.asset('images/products/sweatshirt.jpg'),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Basic Look',style: TextStyle(color: KDarkestColor.withOpacity(.5),
                  fontSize: 10),),
              const Flexible(child: ProductTitleText(title: 'Comfort T-shirt ',size: 15,maxlines: 1,)),
              const SizedBox(height: 4,),
              Text.rich(
                  TextSpan(
                children: [
                  TextSpan(text: 'Color:',style: TextStyle(color: KDarkBlue.withOpacity(.4),fontSize: 13)),
                  const TextSpan(text: 'Blue  ',style: TextStyle(color: KDarkBlue,fontSize: 13)),
                  TextSpan(text: 'Size:',style: TextStyle(color: KDarkBlue.withOpacity(.4),fontSize: 13)),
                  const TextSpan(text: 'M',style: TextStyle(color: KDarkBlue,fontSize: 13)),
                ]
              ))
            ],
          ),
        )
      ],
    );
  }
}
