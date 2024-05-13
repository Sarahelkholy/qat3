import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Enums.dart';
import 'package:qat3/Screens/Product/ProductDetailsScreen.dart';

import '../../Models/ProductModel.dart';
import '../../constants.dart';

class ProductAddToCart extends StatelessWidget {
  final ProductModel product;
  const ProductAddToCart({
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    final cartController=CartController.instance;
    return InkWell(
      onTap: (){
        if(product.productType==ProductType.Single.toString()){
          final cartItem=cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }
        else{
          Get.to(()=>ProductDetails(product: product));
        }
      },
      child: Obx((){
        final productQuantityInCart=cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(20),
            color:productQuantityInCart>0 ?KDarkBlue:KLightGray,
          ),
          child:  SizedBox(
              height: 30,
              width: 30,
              child: Center(child: productQuantityInCart>0?
                  Text(productQuantityInCart.toString(),style: TextStyle(color: Colors.white),):
              Icon(Icons.add,color: KDarkBlue,size: 16,))),
        );
      }

      ),
    );
  }
}