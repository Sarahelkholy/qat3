import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/Products/ProductController.dart';
import 'package:qat3/Models/ProductModel.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Products/FavouritIcon.dart';
import 'package:qat3/widgets/Products/ProductAddToCart.dart';
import 'package:qat3/widgets/Products/ProductPrice.dart';
import '../../Screens/Product/ProductDetailsScreen.dart';
class ItemContainer extends StatelessWidget {
  final ProductModel product;
  final bool showborder;
  final double? productsize;
  const ItemContainer({super.key,required this.product ,this.showborder=false,this.productsize=127});

  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instace;
    final sale=controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDetails(product: product)),
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 13,bottom: 10),
        decoration: BoxDecoration(
         border: showborder? Border.all(color: KLightGray.withOpacity(.3)):null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavouritIcon(productId: product.id,size: 21,),
               if(sale!=null) Container(
                  alignment: Alignment.topLeft,
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: KLightGray.withOpacity(.5)
                  ),
                  child: Center(
                    child: Text('$sale%',style: const TextStyle(
                        color: KDarkestColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(product.thumbnail,height: productsize,width: productsize,),
                ),
                Text(product.title,overflow: TextOverflow.ellipsis,maxLines: 2,
                  style: const TextStyle(
                    color: KDarkestColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 2,),
                Text(product.brand!.name,style: TextStyle(color:KDarkGray, fontSize: 10),),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(product.salePrice>0)
                      ProductPrice(price: product.price.toString(),lineThrogh: true,color: KLightGray,size: 12,),
                      ProductPrice(price: controller.getProductPrice(product),size: 14,)
                  ],
                ),


                //add cart
                ProductAddToCart(product: product,)
              ],
            )
          ],
        ) ,
      ),
    );
  }
}


