import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qat3/Controller/Products/CheckoutController.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';
import 'package:qat3/widgets/SectionHeading.dart';

import '../../Data/Validator.dart';
class PaymentSection extends StatelessWidget {
  const PaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CheckoutController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         SectionHeading(title: 'Payment method',buttontitle: 'Change',padd: EdgeInsets.zero,onPress: ()=>controller.selectPaymentMethod(context),),
        SizedBox(height: 10,),
        Obx( ()=> Column(
          children: [
            Row(
                children: [
                  SizedBox(
                    width: 34,
                      height: 23,
                    child: Image.asset(controller.selectedPaymentMethod.value.image),
                  ),
                   SizedBox(width: 5,),
                   Text(controller.selectedPaymentMethod.value.name,style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)

                ],
              ),
            controller.selectedPaymentMethod.value.name=='Credit card'?
            Form(
              key: controller.checkoutFormKey,
                child: TextContainer(
                  controller: controller.cardnumber,
                  validator:(value)=> Validator.validateCard(value),onchange: (value){},hint: 'Enter card number',)):
                SizedBox()
          ],
        ),
        )
      ],
    );
  }
}
