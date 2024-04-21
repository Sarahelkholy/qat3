import 'package:flutter/material.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';

import '../constants.dart';
import '../widgets/GrideLayout.dart';
import '../widgets/Products/ItemContainer.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Scaffold(

        appBar:Appbar(title:'WishList', Child:IconButton(onPressed:(){}, icon: const Icon(Icons.add,size: 25,color: KDarkBlue,)),
        padd: const EdgeInsets.only(top: 15,left: 5),),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                padding: const EdgeInsets.only(top:30),
                decoration: const BoxDecoration(
                    color:KBackground,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)
                    )
                ),
                child: Column(
                  children: [
                    GrideLayout(itemCount: 8,itemBuilder: (_,index){
                      return const ItemContainer(Name: 'sweatshirt',
                        lable: 'Basic Hoodie',price: 480,SaleTag: true,sale: 50,brand: 'Basic Look',
                      );
                    },)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
