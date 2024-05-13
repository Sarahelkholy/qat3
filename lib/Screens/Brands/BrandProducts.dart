import 'package:flutter/material.dart';
import 'package:qat3/Controller/BrandController.dart';
import 'package:qat3/Models/BrandModel.dart';
import '../../Loader/Shimmer/VerticalProductShimmer.dart';
import '../../widgets/Bars/Appbar.dart';
import '../../widgets/Class/CloudHelperFunctions.dart';
import '../../widgets/Products/AllProducts.dart';
class BrandProducts extends StatelessWidget {
  static const id='BrandProductsScreen';
  final BrandModle brand;
  const BrandProducts({required this.brand});

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: brand.name,showBackArrow: true,height: 80,padd: const EdgeInsets.only(top: 40),),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: controller.getBrandProducts(brand.id),
              builder: (context,snapshot){
                const loader=VerticalProductShimmer();
                final widget=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget!=null) return widget;

                final brandProducts=snapshot.data!;
                return  AllProducts(products:brandProducts,);
              }
        ),
        ),
      ),
    );
  }
}
