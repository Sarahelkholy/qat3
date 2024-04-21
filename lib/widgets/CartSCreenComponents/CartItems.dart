import 'package:flutter/material.dart';

import '../Products/ProductPrice.dart';
import 'AddRemove.dart';
import 'CartProductCard.dart';
import 'package:qat3/constants.dart';
class CartItems extends StatelessWidget {
  final bool showAddRemove;
  const CartItems({super.key, this.showAddRemove=true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_,__)=>const SizedBox(height: 15,),
      itemCount: 2,
      itemBuilder: (_,index)=>Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 5),
            child: Container(

              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: KLightGray)
              ),
              child: Column(
                children: [
                  const CartProductCard(),
                  if(showAddRemove)const SizedBox(height: 8,),
                  if(showAddRemove)  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddRemove(),
                      ProductPrice(price: '280')
                    ],
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
