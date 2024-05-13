import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Screens/Product/ProductDetailsScreen.dart';

import '../Products/ProductPrice.dart';
import 'AddRemove.dart';
import 'CartProductCard.dart';
import 'package:qat3/constants.dart';
class CartItems extends StatelessWidget {
  final bool showAddRemove;
  const CartItems({super.key, this.showAddRemove=true});

  @override
  Widget build(BuildContext context) {
   final cartController=CartController.instance;
    return Obx(()
        =>ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_,__)=>const SizedBox(height: 15,),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_,index)=>Obx((){
          final item=cartController.cartItems[index];
          return  Column(
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
                       CartProductCard(cartItem: item,),
                      if(showAddRemove)const SizedBox(height: 8,),
                      if(showAddRemove)  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddRemove(quantity: item.quantity,add: ()=>cartController.addOneToCart(item),remove: ()=>cartController.removeOneFromCart(item),),

                          ProductPrice(price:item.saleprice!=0?(item.saleprice! * item.quantity).toStringAsFixed(1): (item.price * item.quantity).toStringAsFixed(1))
                        ],
                      )
                    ],
                  ),
                ),
              )


            ],
          );
        }
        ),
      ),
    );
  }
}
