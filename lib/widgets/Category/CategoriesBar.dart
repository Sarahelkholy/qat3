import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CategoryController.dart';
import 'package:qat3/Loader/Shimmer/CategoryShimmer.dart';
import 'package:qat3/Screens/SubCategoryScreen.dart';
import 'package:qat3/constants.dart';

import 'CategoryContainer.dart';
class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController=Get.put(CategoryController());
    return Obx( () {
      if(categoryController.isLoading.value) return const CategoryShimmer();
      if(categoryController.featuredcategories.isEmpty) return Center(
          child:Text('No data found',style: TextStyle(color: KDarkGray),));
      return SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featuredcategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
                final category=categoryController.featuredcategories[index];
                return CategoryContainer(image:category.image,
                    Name:category.name,
                ontap: ()=>Get.to(()=>SubCategoryScreen(category: category)),);
              }),
        ),
      );
    }
    );
  }
}
