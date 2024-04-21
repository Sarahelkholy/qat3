import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/SignUpController.dart';
import 'package:qat3/Data/Validator.dart';
import 'package:qat3/Screens/Start/LoginScreen.dart';
import 'package:qat3/widgets/RoundButton.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';
import 'package:qat3/constants.dart';


class RegisterScreen extends StatefulWidget {
 static const id='RegisterScreen';
  const RegisterScreen({super.key,});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String name;
  late String email;
  late String phone;
  late String password;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignUpController());
    return Form(
      key: controller.SignUpFormKey,
      child: Scaffold(
        backgroundColor:  KBackground,
       body: SafeArea(
         child: SingleChildScrollView(
           physics: const AlwaysScrollableScrollPhysics(),
           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
           child: Expanded(
             child: Column(
               children: [
                 Container(
                   alignment: Alignment.topLeft,
                   child: InkWell(
                     onTap: (){
                       Navigator.pop(context);
                     }, child: const Icon(Icons.arrow_back_ios,color:KDarkBlue,size: 20,),
                   ),
                 ),
                 const SizedBox(height: 30,),
                 const Text('Sign up',style: TextStyle(color: KDarkBlue,fontSize: 37,
                     fontWeight: FontWeight.w600),),
                 const SizedBox(height: 10,),
                 const Text('Create an account so you can order your favorite items.  ',style: TextStyle(color: KDarkGray,
                     fontSize: 16,
                     fontWeight: FontWeight.w500),),
                 const SizedBox(height: 40,),
                 Row(
                   children: [
                     Expanded(
                       child: TextContainer(
                         validator: (value)=>Validator.validateEmptyText('First Name',value),
                         controller: controller.FirstName,
                         title: 'First Name',onchange: (value){
                         name=value;
                       },),
                     ),
                     const SizedBox(width: 4,),
                     Expanded(
                       child: TextContainer(
                         validator: (value)=>Validator.validateEmptyText('Last Name',value),
                         controller: controller.LastName,
                         title: 'Last Name',onchange: (value){
                         name=value;
                       },),
                     ),
                   ],
                 ),
                 const SizedBox(height: 7,),
                 TextContainer( validator: (value)=>Validator.validateEmptyText('User Name',value),controller: controller.UserName,title: 'User Name',onchange: (value){
                   name=value;
                 },),
                 const SizedBox(height: 7,),
                 TextContainer(
                   validator: (value)=>Validator.validateEmail(value),
                   controller: controller.Email,title: 'Email',onchange:(value){
                   email=value;
                 }, ),
                 const SizedBox(height: 7,),
                 TextContainer( validator: (value)=>Validator.validatePhone(value),
                   controller: controller.Phone,title: 'Phone Number',onchange:(value){
                   phone=value;
                 }, ),
                 const SizedBox(height: 7,),
                 Obx(
                     ()=> TextContainer(
                     validator: (value)=>Validator.validatePassword(value),
                     controller: controller.Password,title: 'Password',onchange: (value){
                     password=value;
                   },scure: controller.hidePassword.value,
                   suffix: IconButton(icon: const Icon(Icons.remove_red_eye_sharp,color: KLightGray,),
                     onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,),),
                 ),
                 const SizedBox(height: 20,),
                 RoundButton(text: 'Create account', onPress: ()=>controller.Signup(),
                   color: KDarkBlue,
                   Textcolor:  Colors.white,
                   Width: 150,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text('Already have an account ?',style: TextStyle(color: KDarkGray,
                         fontSize: 14,
                         fontWeight: FontWeight.w500), ),
                     TextButton(onPressed: (){
                       Navigator.pushNamed(context, LoginScreen.id);
                     }, child: const Text('Login',style: TextStyle(color:  KDarkBlue,fontSize: 16,fontWeight: FontWeight.bold)),)
                   ],
                 )
               ],
             ),
           ),
         ),
       ),
      ),
    );
  }
}
