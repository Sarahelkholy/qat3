import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import '../widgets/Bars/Appbar.dart';
import '../widgets/Containers/BrandContainer.dart';
import '../widgets/Category/CategoryTab.dart';
import '../widgets/GrideLayout.dart';
import '../widgets/Bars/Searchbar.dart';
import '../widgets/SectionHeading.dart';
import '../widgets/Bars/Tabbar.dart';
import 'package:badges/badges.dart' as badges;
import 'Brands/AllBrandScreen.dart';
import 'CartScreen.dart';
class StoreScreen extends StatelessWidget {

  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: Appbar(title: 'Store',Child:badges.Badge(
            badgeColor: KLightGray,
            padding: const EdgeInsets.all(4),
            badgeContent: const Text('3',style: TextStyle(
                color: KDarkBlue
            ),),
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
                            SectionHeading(title: 'Featured Brands',showButton: true,onPress: (){
                              Navigator.pushNamed(context, AllBrandScreen.id);
                            },
                            ),
                            GrideLayout(itemCount: 4,itemBuilder: (_,index){
                             return const BrandContainer(BrandName: 'Basic Look');
                            },mainAxis: 80,)
                          ],
                        ),
                      ),
                      bottom: const Tabbar(
                        taps: [
                          Tab(child: Text('T-shirts'),),
                          Tab(child: Text('Pants'),),
                          Tab(child: Text('Bags'),),
                          Tab(child: Text('Make up'),),
                          Tab(child: Text('Self Care'),),
                        ],
                      )
                    )
                  ];
                },
            body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
              )
        ),
      ),
    );

  }
}
