import 'package:flutter/material.dart';
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
  //final _auth=FirebaseAuth.instance;
  //late User LoggedUser;

  @override
  /*void initState() {
    super.initState();
    getcurrentuser();
  }*/
  /*void getcurrentuser()async{
    try {
      final user = _auth.currentUser;
      if(user!=null){
        LoggedUser=user;
        print(LoggedUser.email);
      }
    }catch(e){
      print(e);
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Appbar(title: 'Home',Child: badges.Badge(
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
                SectionHeading(title: 'Popular Products',onPress: (){
                  Navigator.pushNamed(context, AllProductScreen.id);
                },),
                //change items implementation
                GrideLayout(itemCount: 6,itemBuilder: (_,index){
                  return const ItemContainer(Name: 'sweatshirt',
                    lable: 'Basic Hoodie',price: 480,SaleTag: true,sale: 50,brand: 'Basic Look',
                  );
                },)
                    ],
                  ),
                )
              ],
      ),
          );

  }
}
