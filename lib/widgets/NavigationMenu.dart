import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Screens/Product/HomePage.dart';
import 'package:qat3/Screens/Profile/SettingScreen.dart';
import 'package:qat3/Screens/StoreScreen.dart';
import 'package:qat3/Screens/WishListScreen.dart';
import 'package:qat3/constants.dart';
class NavigationMenu extends StatelessWidget {
  static const id='NavigationMenu';
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          indicatorColor: Colors.white,
          surfaceTintColor: Colors.white,
          backgroundColor: KBackground,
          height: 55,
          elevation: 10,
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index)=>controller.selectedindex.value=index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined,color: KDarkestColor,size: 25,), label: 'Home',),
            NavigationDestination(icon: Icon(Icons.storefront,color:  KDarkestColor,size: 25,), label: 'Store'),
            NavigationDestination(icon: Icon(Icons.favorite_outline,color:  KDarkestColor,size: 25,), label: 'WishList'),
            NavigationDestination(icon: Icon(Icons.person_outlined,color:  KDarkestColor,size: 25,), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(()=> controller.Screens[controller.selectedindex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedindex=0.obs;
  final Screens=[const HomePage(),const StoreScreen(),const WishListScreen(),const SettingScreen()];
}