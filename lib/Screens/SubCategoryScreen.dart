import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CategoryController.dart';
import 'package:qat3/Loader/Shimmer/VerticalProductShimmer.dart';
import 'package:qat3/Models/CtegoryModel.dart';
import 'package:qat3/Screens/Product/AllProductScreen.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
import 'package:qat3/widgets/Products/ItemContainer.dart';
import 'package:qat3/widgets/SectionHeading.dart';
import '../Controller/CartController.dart';
import '../constants.dart';
import '../widgets/Bars/Appbar.dart';
import '../widgets/Category/SubCategory/SubCategorySection.dart';
import '../widgets/GrideLayout.dart';
import 'package:badges/badges.dart' as badges;

import 'CartScreen.dart';


class SubCategoryScreen extends StatelessWidget {
  static const id='SubCategoryScreen';
  final CategoryModel category;

  const SubCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final cartController=Get.put(CartController());
    final controller=CategoryController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title:category.name,showBackArrow: true,height: 75,
        padd: const EdgeInsets.only(top: 36,right: 20),
        Child: badges.Badge(
          badgeColor: KLightGray,
          padding: const EdgeInsets.all(4),
          badgeContent:  Obx(
                ()=> Text(cartController.noOfCartItems.value.toString(),style: TextStyle(
                color: KDarkBlue
            ),),
          ),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, CartScreen.id);
            },
            child: const Icon(
              Icons.shopping_cart,
              color: KDarkBlue,
              size: 25,
            ),
          ),
        ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              //banner
             Padding(
                padding: const EdgeInsets.only(top: 13,left: 12,right: 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:  Image(fit:BoxFit.contain ,image: AssetImage(category.banner!),),
                  ),
                ),
              ),
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context,snapshot){
                  const loader=VerticalProductShimmer();
                  final widget=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget!=null) return widget;

                  final subCategories=snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_,index){
                      final subCategory=subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: subCategory.id,limit: 2),
                          builder: (context, snapshot) {

                            final widget=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                            if(widget!=null) return widget;
                            final produts=snapshot.data!;

                            return Column(
                              children: [
                                const SizedBox(height: 10,),
                                 SectionHeading(title: subCategory.name,onPress: ()=>Get.to(
                                         ()=>AllProductScreen(title: subCategory.name,
                                         futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),
                                         )),
                                 ),
                                const SizedBox(height: 5,),
                               GrideLayout(itemCount: produts.length, itemBuilder: (_,index){
                                 return  ItemContainer(showborder: true,product: produts[index],
                                 );
                               })
                              ],
                            );
                          }
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

