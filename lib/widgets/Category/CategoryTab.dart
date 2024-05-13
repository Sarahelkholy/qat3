import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CategoryController.dart';
import 'package:qat3/Loader/Shimmer/VerticalProductShimmer.dart';
import 'package:qat3/Models/CtegoryModel.dart';
import 'package:qat3/Screens/Product/AllProductScreen.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
import 'package:qat3/widgets/GrideLayout.dart';
import 'package:qat3/widgets/Products/ItemContainer.dart';

import '../SectionHeading.dart';
class CategoryTab extends StatelessWidget {
  final CategoryModel category;
  const CategoryTab({required this.category});

  @override
  Widget build(BuildContext context) {
    final controller=CategoryController.instance;
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics() ,
        children: [
          FutureBuilder(
        future: controller.getCategoryProducts(categoryId: category.id),
            builder: (contaxt,snapshot){
        final response=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot ,loader: VerticalProductShimmer());
        if(response!=null) return response;
        final products=snapshot.data!;
              return Column(
                children: [
                  SectionHeading(title: 'You might Like',showButton: true,
                    onPress: ()=>Get.to(AllProductScreen(title: category.name,
                      futureMethod:controller.getCategoryProducts(categoryId: category.id,limit: -1) ,)),),
                  GrideLayout(itemCount: products.length, itemBuilder: (_,index){
                    return  ItemContainer(showborder: true,product: products[index],
                    );
                  })
                ],
              );
            },

          ),
        ],
      ),
    );
  }
}
