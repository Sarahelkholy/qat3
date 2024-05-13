
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/Products/ImagesController.dart';
import 'package:qat3/widgets/Products/FavouritIcon.dart';
import '../../Models/ProductModel.dart';
import '../../constants.dart';
import '../Products/CurvedEdges.dart';
import 'ImageSliderContent.dart';
class ProductImageSlider extends StatelessWidget {
   ProductModel product;
   ProductImageSlider({required this.product});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ImagesController());
    final images=controller.getAllProductImages(product);
    return  CurvedEdges(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 310,
                  child: Center(
                    child: Obx((){
                      final image=controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=>controller.showEnlargeImage(image,false),
                          child: Image.asset(image,));
                    }),
                      ),
                      ),
                      ),
              Positioned(bottom: 10,
                left: 10,
                right: 10,
                child: SizedBox(
                  height: 70,
                  child: ListView.separated(
                    itemCount:images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics:  AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __)=>const SizedBox(width: 10,),
                    itemBuilder: (_,index)=>Obx((){
                      final selectedimage=controller.selectedProductImage.value==images[index];
                      return ImageSliderContent(
                        onTab: ()=>controller.selectedProductImage.value= images[index],
                        width: 60,
                        color: Colors.white,
                        border: Border.all(color:selectedimage? KDarkGray:Colors.transparent),
                        padd: const EdgeInsets.symmetric(vertical: 5),
                        imageUrl:images[index] ,
                        );
                      }
                      ),
                  ),
                ),
              ),
             ListTile(
               leading: IconButton(
                 onPressed: (){
                   Navigator.pop(context);
                 } ,
                 icon: const Icon(Icons.arrow_back,color: KDarkBlue,size: 30,weight: 50,),
               ),
               trailing:FavouritIcon(productId: product.id,size: 25,)
             )

            ],
          ),
        ),
      ),
    );
  }
}

