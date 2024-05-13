import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/BrandController.dart';
import 'package:qat3/Models/BrandModel.dart';
import 'package:qat3/Screens/Brands/BrandProducts.dart';

import '../../Loader/Shimmer/BrandsShimmer.dart';
import '../../widgets/Bars/Appbar.dart';
import '../../widgets/Containers/BrandContainer.dart';
import '../../widgets/GrideLayout.dart';
class AllBrandScreen extends StatelessWidget {
  static const id='AllBrandScreen';
  const AllBrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: 'Brands',showBackArrow: true,height: 80,padd: const EdgeInsets.only(top: 40),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Obx((){
        if(controller.isLoading.value) return const BrandsShimmer();
        if(controller.allBrands.isEmpty){
        return Center(
        child: Text('No Data Found'),
        );
        }
        return GrideLayout(
        itemCount: controller.allBrands.length,
        itemBuilder: (_,index){
        final brand=controller.allBrands[index];
        return  BrandContainer(brand:  brand,ontap: ()=>Get.to(()=>BrandProducts(brand: brand,)),);
        },
        mainAxis: 80,);
        }
              )
            ],
          ),
        ),
      ),
    );
  }
}
