import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class PaymentAmountSection extends StatelessWidget {
  const PaymentAmountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal:',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 17),),
            Text('EGP 280',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        ),
        SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping:',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 17),),
            Text('EGP 20',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        ),
        SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Cost:',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 17),),
            Text('EGP 300',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        )
      ],
    );
  }
}
