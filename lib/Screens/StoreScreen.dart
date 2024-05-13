import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qat3/Controller/BrandController.dart';
import 'package:qat3/Controller/CategoryController.dart';
import 'package:qat3/Loader/Shimmer/BrandsShimmer.dart';
import 'package:qat3/constants.dart';
import '../Controller/CartController.dart';
import '../widgets/Bars/Appbar.dart';
import '../widgets/Containers/BrandContainer.dart';
import '../widgets/Category/CategoryTab.dart';
import '../widgets/GrideLayout.dart';
import '../widgets/Bars/Searchbar.dart';
import '../widgets/SectionHeading.dart';
import '../widgets/Bars/Tabbar.dart';
import 'package:badges/badges.dart' as badges;
import 'Brands/AllBrandScreen.dart';
import 'Brands/BrandProducts.dart';
import 'CartScreen.dart';


class StoreScreen extends StatelessWidget {

  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandController=Get.put(BrandController());
    final cartController=Get.put(CartController());

    final categoryController=CategoryController.instance.featuredcategories;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: DefaultTabController(
        length: categoryController.length,
        child: Scaffold(
          appBar: Appbar(title: 'Store',Child:badges.Badge(
            badgeColor: KLightGray,
            padding: const EdgeInsets.all(4),
            badgeContent: Obx(
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
          ), ),
          body: NestedScrollView(
                headerSliverBuilder: (_,innerBoxIsScrolled){
                  return[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      backgroundColor: Colors.white,
                      expandedHeight: 350,
                      flexibleSpace: Padding(
                        padding: EdgeInsets.zero,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Searchbar(color: KBackground.withOpacity(.3),),
                            SectionHeading(title: 'Featured Brands',showButton: true,
                              onPress: ()=>Get.to(()=>const AllBrandScreen())
                            ),


                            Obx((){
                              if(brandController.isLoading.value) return const BrandsShimmer();
                              if(brandController.featuredBrands.isEmpty){
                                return Center(
                                  child: Text('No Data Found'),
                                );
                              }

                              return GrideLayout(
                                itemCount: brandController.featuredBrands.length,
                                itemBuilder: (_,index){
                                  final brand=brandController.featuredBrands[index];
                                return  BrandContainer(brand:  brand,ontap:  ()=>Get.to(()=>BrandProducts(brand: brand,),));
                              },
                                mainAxis: 80,);
                            }

                            )
                          ],
                        ),
                      ),
                      bottom:  Tabbar(
                        taps: categoryController.map((category) => Tab(child: Text(category.name))).toList(),
                      )
                    )
                  ];
                },
            body:  TabBarView(
            children: categoryController.map((category) => CategoryTab(category: category,)).toList(),
          ),
              )
        ),
      ),
    );

  }
}
