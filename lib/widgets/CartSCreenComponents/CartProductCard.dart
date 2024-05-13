import 'package:flutter/material.dart';
import 'package:qat3/Models/CartItemModel.dart';
import 'package:qat3/widgets/Products/ProductTitleText.dart';

import '../../constants.dart';
class CartProductCard extends StatelessWidget {
  final CartItemModel cartItem;
  const CartProductCard({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.asset(cartItem.image!),
        ),
        SizedBox(width: 4,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.brandName!,style: TextStyle(color: KDarkestColor.withOpacity(.5),
                  fontSize: 10),),
               Flexible(child: ProductTitleText(title: cartItem.title,size: 15,maxlines: 1,)),
              const SizedBox(height: 4,),
              Text.rich(
                  TextSpan(
                children: (cartItem.selectedVariation??{}).entries.
                map((e) =>
                    TextSpan(children: [
                      TextSpan(text: '${e.key} : ',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold)),

                      TextSpan(text: '${e.value}   ',style: TextStyle(color: KDarkGray)),
                    ],
                    ),
                ).toList(),
              ))
            ],
          ),
        )
      ],
    );
  }
}
