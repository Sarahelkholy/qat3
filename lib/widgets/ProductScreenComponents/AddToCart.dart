import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Models/ProductModel.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/NavigationMenu.dart';
class AddToCart extends StatelessWidget {
  final ProductModel product;
  const AddToCart({required this.product});

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
        color: KBackground.withOpacity(.4),

        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Obx(()=>
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child:
                 Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: KDarkBlue.withOpacity(.6),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(onPressed:()=> controller.productQuantityInCart.value<1?null:controller.productQuantityInCart.value-=1,
                        icon: const Icon(Icons.remove,size: 16,color: Colors.white,),),
                    ),
                    const SizedBox(width: 8,),
                     Text(controller.productQuantityInCart.value.toString(),style: TextStyle(color: KDarkestColor,fontSize: 20),),
                    const SizedBox(width: 8,),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: KDarkBlue
                      ),
                      child: IconButton(onPressed: ()=>controller.productQuantityInCart+=1,
                        icon: const Icon(Icons.add,size: 16,color: Colors.white,),),
                    ),
                  ],
                ),
              ),
            ElevatedButton(onPressed: (){
              controller.productQuantityInCart<1?Loaders.errorSnackBar(title: 'Whoops',message: 'Select Quantity'):controller.addToCart(product);
              Get.back();},
                style: ElevatedButton.styleFrom(
                  backgroundColor: KDarkBlue,

                ),
                child: const Text('Add to cart',style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
