import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Models/PaymentModel.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/PaymentTile.dart';
import 'package:qat3/widgets/SectionHeading.dart';

class CheckoutController extends GetxController{
  static CheckoutController get instance=>Get.find();
  final cardnumber=TextEditingController();
  final Rx<PaymentModel> selectedPaymentMethod=PaymentModel.empty().obs;
  GlobalKey<FormState> checkoutFormKey=GlobalKey<FormState>();

  @override
  void onInit() {
    selectedPaymentMethod.value=PaymentModel(name: 'Cash on delivery', image: 'images/pay/cash.png');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
      context: context,
      builder:(_)=>SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) )
          ),
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              const SizedBox(height: 6,),
              const SectionHeading(title: 'Select Payment Method',showButton: false,),
              const SizedBox(height: 6,),
              PaymentTile(paymentmethod: PaymentModel(name: 'Cash on delivery', image: 'images/pay/cash.png')),
              PaymentTile(paymentmethod: PaymentModel(name: 'Credit card', image: 'images/pay/credit.png',cardnum: cardnumber.text.trim())),
            ],
          ),
        ),
      )
    );
  }
}