import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Controller/Products/CheckoutController.dart';
import 'package:qat3/Data/PricingCalculator.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/CartSCreenComponents/CartItems.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/AddressSection.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/PaymentAmountSection.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/PaymentSection.dart';
import '../Controller/OrderController.dart';
import '../widgets/Bars/Appbar.dart';
class CheckOutScreen extends StatelessWidget {
  static const id='CheckOut';

  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
    final subtotal=CartController.instance.totalCartPrice.value;
    final checkoutController=Get.put(CheckoutController());
    final totalAmount=PricingCalculator.calculateTotalPrice(subtotal, 'Egypt');
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:Appbar(title: 'Order review',showBackArrow: true,height: 85,padd: const EdgeInsets.only(top: 30),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(13.0),
              child: Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: CartItems(showAddRemove: false,),
                   ),
                   SizedBox(height: 10,),

                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.white,border: Border.all(color: KLightGray)),
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      children: [
                        PaymentAmountSection(),
                        SizedBox(height: 8,),
                        Divider(color: KLightGray,),
                        PaymentSection(),
                        SizedBox(height: 24,),
                        AddressSection(),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: ()=> controller.processOrder(totalAmount),
         style: ElevatedButton.styleFrom(
            backgroundColor: KDarkBlue
        ),child: const Text('Pay now',style: TextStyle(color: Colors.white,fontSize: 15),), ),
      ),
    );
  }
}

