import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Screens/CheckOutScreen.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/CartSCreenComponents/CartItems.dart';

import '../constants.dart';


class CartScreen extends StatelessWidget {
  static const id='CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:Appbar(title: 'Cart',showBackArrow: true,height: 75,padd: const EdgeInsets.only(top: 45),),
      body:  Obx((){
        final emptywidget=Center(child: Text('Whoops! Cart is empty',style: TextStyle(fontSize: 18,color: KLightGray),));
        if(controller.cartItems.isEmpty){
          return emptywidget;
        }
        else{
          return Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: CartItems()
          );
        }
      }
      ),
      bottomNavigationBar:Obx(()=>
        controller.cartItems.isEmpty? SizedBox(): SizedBox(
          height: 50,
          child: ElevatedButton(onPressed: ()=>Get.to(()=>CheckOutScreen())
          ,style: ElevatedButton.styleFrom(
              backgroundColor: KBackground
          ),child: Text('Check out ${controller.totalCartPrice.value} EGP ',style: TextStyle(color: KDarkBlue,fontSize: 15),)

          ),
        ),
      ),
    );
  }
}


