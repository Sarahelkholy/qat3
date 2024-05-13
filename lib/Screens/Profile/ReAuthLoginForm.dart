import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/UserController.dart';
import 'package:qat3/Data/Validator.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';

import '../../constants.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: 'Re-Authenticat User',
      showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextContainer(onchange: (value){},
                  title:'Email' ,
                controller: controller.verifyEmail,
                validator: (value)=>Validator.validateEmail(value),),
                SizedBox(height: 8,),
                Obx(
                      ()=> TextContainer(
                    validator: (value)=>Validator.validateEmptyText('Password',value),
                    controller: controller.verifyPassword,
                        title: 'Password',
                        onchange: (value){},
                        scure: controller.hidePassword.value,
                    suffix: IconButton(icon: const Icon(Icons.remove_red_eye_sharp,color: KLightGray,),
                      onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,),),
                ),
                SizedBox(height: 18,),
                Center(
                  child: SizedBox(
                    width: 250,
                   child:  ElevatedButton(onPressed: ()=>controller.reAuthenticateEmailAndPasswordUser(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: KDarkBlue
                      ),child: const Text('Verify', style: TextStyle(color: Colors.white,fontSize: 17),),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
