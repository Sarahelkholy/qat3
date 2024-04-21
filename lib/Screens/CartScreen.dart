import 'package:flutter/material.dart';
import 'package:qat3/Screens/CheckOutScreen.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/CartSCreenComponents/CartItems.dart';

import '../constants.dart';


class CartScreen extends StatelessWidget {
  static const id='CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:Appbar(title: 'Cart',showBackArrow: true,height: 75,padd: const EdgeInsets.only(top: 45),),
      body: const Padding(
        padding: EdgeInsets.only(top:10,bottom: 8),
        child: Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: CartItems()
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, CheckOutScreen.id);
        } ,style: ElevatedButton.styleFrom(
            backgroundColor: KBackground
        ),child: const Text('Check out "EGP 670" ',style: TextStyle(color: KDarkBlue,fontSize: 15),), ),
      ),
    );
  }
}


