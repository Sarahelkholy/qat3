import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Controller/Products/ProductController.dart';
import 'package:qat3/Loader/Shimmer/VerticalProductShimmer.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Category/CategoriesBar.dart';
import '../../widgets/GrideLayout.dart';
import '../../widgets/Products/ItemContainer.dart';
import '../../widgets/SectionHeading.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:qat3/widgets/Bars/Searchbar.dart';
import '../CartScreen.dart';
import 'AllProductScreen.dart';

class HomePage extends StatefulWidget {
  static const id='HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductController());
    final cartController=Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Appbar(title: 'Home',Child: badges.Badge(
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
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color:KBackground,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35)
              )
            ),
            child: Column(
              children: [
                const Searchbar(),
                const SizedBox(height: 15,),
                const SectionHeading(title: 'Popular Categories',showButton: false,),
                const CategoriesBar(),
                SectionHeading(title: 'Popular Products',onPress: ()=>Get.to(()=>
                    AllProductScreen(title:  'Popular Products',
                    futureMethod: controller.fetchAllFeaturedProducts(),)
                )),
                //change items implementation
              Obx((){
                  if(controller.isLoading.value) return const VerticalProductShimmer();
                  if(controller.featuredProducts.isEmpty)
                    return Center(child: Text('No Data Found',style: TextStyle(color: KDarkBlue),),);
                   return  GrideLayout(
                    itemCount: controller.featuredProducts.length,
                    itemBuilder: (_,index){
                      final product=controller.featuredProducts[index];
                    return  ItemContainer(product:product );
                  },);
                }

              )
                    ],
                  ),
                )
              ],
      ),

          );

  }
}
