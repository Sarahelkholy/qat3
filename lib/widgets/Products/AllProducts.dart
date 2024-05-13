import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/AllProductsController.dart';

import '../../Models/ProductModel.dart';
import '../../constants.dart';
import '../GrideLayout.dart';
import 'ItemContainer.dart';
class AllProducts extends StatelessWidget {
final List<ProductModel> products;
   AllProducts({super.key,required this.products});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),

          child: DropdownButtonFormField(
            value: controller.selectedSortOption.value,
            decoration: const InputDecoration(prefixIcon: Icon(Icons.sort,color: KDarkBlue,),border: InputBorder.none),
            onChanged: (value){
              controller.sortProduct(value!);
            },
            items: ['Name','Higher Price','Lower Price','Sales']
                .map((option) => DropdownMenuItem(value: option,child: Text(option,style: const TextStyle(color: KDarkBlue),))).toList(),
          ),
        ),
        Obx(()=>
          GrideLayout(itemCount: controller.products.length,itemBuilder: (_,index){
            return  ItemContainer(product:controller.products[index],showborder: true,);
          },),
        )
      ],
    );
  }
}
