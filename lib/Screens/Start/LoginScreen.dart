import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/LoginController.dart';
import 'package:qat3/Data/Validator.dart';
import 'package:qat3/Screens/Start/ForgetPasswordScreen.dart';
import 'package:qat3/widgets/RoundButton.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';
import 'package:qat3/constants.dart';
class LoginScreen extends StatefulWidget {
 static const id='LoginScreen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return Scaffold(
      backgroundColor: KBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Column(
            children: [
              //header
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  }, child: const Icon(Icons.arrow_back_ios,color:KDarkBlue,size: 20,),
                ),
              ),
              const SizedBox(height: 50,),
              const Text('Welcome Back',style: TextStyle(color: KDarkBlue,fontSize: 37,
              fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              const Text('Sign in to your account',style: TextStyle(color: KDarkGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),),
              const SizedBox(height: 50,),
              //form
              Form(
                key: controller.LoginFormKey,
                child: Column(
                  children: [
                    TextContainer(controller:controller.Email ,
                      validator:(value)=>Validator.validateEmail(value),
                      title: 'Email',onchange: (value){
                        email=value;
                      },),
                    const SizedBox(height: 17,),
                    Obx(
                          ()=> TextContainer(
                        validator: (value)=>Validator.validateEmptyText('Password',value),
                        controller: controller.Password,title: 'Password',onchange: (value){
                        password=value;
                      },scure: controller.hidePassword.value,
                        suffix: IconButton(icon: const Icon(Icons.remove_red_eye_sharp,color: KLightGray,),
                          onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Remember me',style: TextStyle(color: KDarkGray,fontSize: 15,fontWeight: FontWeight.w500),),
                            Obx(
                                  ()=>Checkbox(
                                side: const BorderSide(color: KDarkGray,width: 2),
                                value: controller.rememberme.value,
                                onChanged: (value)=>controller.rememberme.value = !controller.rememberme.value
                                ,checkColor: KBackground,activeColor: KDarkBlue,),
                            ),
                          ],
                        ),
                        TextButton(onPressed: ()=>Get.to(()=>ForgetPasswordScreen()),
                            child: const Text('Forgot Password?',style: TextStyle(color: KDarkGray,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),)),
                      ],
                    ),
                  ],
                ),
              ),
              //bottom
              Container(
                alignment: Alignment.center,
                child: RoundButton(text: 'Log In', onPress: ()=>controller.emailAndpasswordSignin(),
                  color: KDarkBlue,
                  Textcolor:  Colors.white,
                  Width: 150,
                ),
              ),
             const Divider(endIndent: 60,indent: 60,color: KLightGray,),
            TextButton(onPressed: ()=>controller.googleSignin(),
          child: const Text('Sign in with google account',style: TextStyle(color:  KDarkGray,fontSize: 12,fontWeight: FontWeight.bold)),)
            ],
          ),
        ),
      ),
    );
  }
}
