import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Models/PaymentModel.dart';
import 'package:qat3/constants.dart';

import '../../Controller/Products/CheckoutController.dart';

class PaymentTile extends StatelessWidget {
  final PaymentModel paymentmethod;
  const PaymentTile({required this.paymentmethod});

  @override
  Widget build(BuildContext context) {

    final controller=Get.put(CheckoutController());
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      onTap: () {
    controller.selectedPaymentMethod.value=paymentmethod;
    Get.back();
      },
    leading: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(100)

      ),
      padding: EdgeInsets.all(8),
      child: Image(image: AssetImage(paymentmethod.image),fit: BoxFit.contain,),
    ),
      title: Text(paymentmethod.name),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,color: KDarkBlue,),
    );

  }
}
