import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Models/ProductModel.dart';
import 'package:qat3/constants.dart';

class ImagesController extends GetxController{
 static ImagesController get instance=>Get.find();

 RxString selectedProductImage= ''.obs;
 
 List<String> getAllProductImages(ProductModel product){
   Set<String> Images={};
   Images.add(product.thumbnail);
   selectedProductImage.value=product.thumbnail;
   if(product.image!=null){
     Images.assignAll(product.image!);
   }
  else if(product.productVariation!=null){
     Images.assignAll(product.productVariation!.map((variation) => variation.image));
   }
   return Images.toList();
 }
 
 void showEnlargeImage(String image,bool isNetwork){
   Get.to(
     fullscreenDialog: true,
       ()=>Dialog.fullscreen(
         backgroundColor: Colors.white,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
           children: [
             Padding(
                 padding:EdgeInsets.symmetric(vertical: 20,horizontal: 10),
               child:isNetwork? CachedNetworkImage(imageUrl: image,):Image.asset(image),
             ),
             SizedBox(height: 10,),
             Align(
               alignment: Alignment.bottomCenter,
               child: SizedBox(
                 width: 150,
                 child: OutlinedButton(onPressed: ()=>Get.back(),child: const Text('Close',style: TextStyle(color: KDarkBlue,fontSize: 15,),),),
               ),
             )
           ],
         ),
       )
   );
 }
}