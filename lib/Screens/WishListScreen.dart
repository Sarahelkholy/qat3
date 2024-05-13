import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qat3/Controller/Products/FavouritesController.dart';
import 'package:qat3/Loader/Shimmer/VerticalProductShimmer.dart';
import 'package:qat3/Screens/Product/HomePage.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
import 'package:qat3/widgets/NavigationMenu.dart';

import '../constants.dart';
import '../widgets/GrideLayout.dart';
import '../widgets/Products/ItemContainer.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=FavouritesController.instance;
    return Scaffold(

      appBar:Appbar(title:'WishList',height: 85,padd: const EdgeInsets.only(top: 30,left: 3),),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              children: [
                Obx(()=>
                  FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context,snapshot){
                      final emptywidget=Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: Center(child: Text('Whoooops! Wishlist is empty.....',style: TextStyle(fontSize: 18,color: KLightGray),)),
                      );
                      const loader=VerticalProductShimmer(itemCount: 6,);
                      final widget=CloudHelperFunctions.checkMultiRecordState(snapshot:snapshot ,loader: loader,nothingFound: emptywidget);
                      if(widget!=null) return widget;
                      final products=snapshot.data!;
                      return GrideLayout(itemCount: products.length,itemBuilder: (_,index)=>ItemContainer(product:products[index],showborder: true,));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
