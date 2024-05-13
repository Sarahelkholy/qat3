import 'package:flutter/material.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Data/PricingCalculator.dart';
import 'package:qat3/constants.dart';
class PaymentAmountSection extends StatelessWidget {
  const PaymentAmountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    final subTotal=controller.totalCartPrice.value;
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal:',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 17),),
            Text('$subTotal EGP',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        ),
        SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping:',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 17),),
            Text('${PricingCalculator.calculateShippingCost(subTotal, 'Egypt')} EGP',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        ),
        SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Cost:',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 17),),
            Text('${PricingCalculator.calculateTotalPrice(subTotal, 'Egypt')} EGP',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        )
      ],
    );
  }
}
