import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/Products/FavouritesController.dart';

import '../../constants.dart';

class FavouritIcon extends StatelessWidget {
  final String productId;
  final double size;
  const FavouritIcon({required this.productId, required this.size});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(FavouritesController());
    return  Obx(()=>
       InkWell(
          onTap: ()=>controller.toggleFavouriteProduct(productId),
          child:controller.isFavourite(productId) ?Icon(Icons.favorite,color: KDarkBlue,size: size):Icon(Icons.favorite_border,color: KDarkBlue,size: size)
      ),
    );
  }
}
