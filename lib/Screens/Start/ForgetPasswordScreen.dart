import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/ResetPasswordController.dart';
import 'package:qat3/Data/Validator.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: 'Forget Password',showBackArrow: true,),
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Text('Don\'\ t worry, enter your email and we will send you a password reset link ',style: TextStyle(color: KDarkGray,fontSize: 15),),
            SizedBox(height: 10,),

            Form(
              key: controller.forgetPasswordFormKey,
              child: TextContainer(
                controller: controller.email,
                validator: Validator.validateEmail,
               hint: 'Email',
                onchange: (value){
                  controller.email.text=value;
                },
              ),
            ),
            SizedBox(height: 12,),
            SizedBox(
              width: 300,
              child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: KDarkBlue
                ),child: const Text('Submit', style: TextStyle(color: Colors.white,fontSize: 15),),),
            ),

          ],
        ),
      ),
    );
  }
}
