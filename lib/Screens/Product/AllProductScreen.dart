import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Loader/Shimmer/VerticalProductShimmer.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
import '../../Controller/AllProductsController.dart';
import '../../Models/ProductModel.dart';
import '../../widgets/Products/AllProducts.dart';

class AllProductScreen extends StatelessWidget {
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  static const id='AllProductScreen';
  const AllProductScreen({required this.title,this.query,this.futureMethod});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: title,showBackArrow: true,height: 85,padd: const EdgeInsets.only(top: 35),),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: futureMethod??controller.fetchProductsByQuery(query),
            builder: (context,snapshot){
            const loader=VerticalProductShimmer();
            final widget=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
            if(widget!=null) return widget;
            final products=snapshot.data!;
            return AllProducts(products: products,);
            },
            ),
      ),
    );
  }
}

