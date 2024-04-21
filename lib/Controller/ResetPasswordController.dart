import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Screens/Start/ResetPasswordScreen.dart';
import '../Data/NetworkManager.dart';
import '../Data/Repositories/AuthenticationRepository.dart';
import '../Loader/FullScreenLoader.dart';
import '../Loader/Loaders.dart';

class ResetPasswordController extends GetxController{
 static ResetPasswordController get instace=>Get.find();

 final email=TextEditingController();
 GlobalKey<FormState> forgetPasswordFormKey=GlobalKey<FormState>();

 sendPasswordResetEmail() async{
   try{
     final isConnected=await NetworkManager.instance.isConnected();
     if(!isConnected){
       return;
     }
     if(!forgetPasswordFormKey.currentState!.validate()){
       return;
     }
     await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
     Loaders.successSnackBar(title: 'Email sent..',message: 'Please check your inbox');
     Get.to(()=> ResetPasswordScreen(email:email.text.trim()) );
   }catch(e){
     Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
   }
 }

 ResendPasswordResetEmail(String email) async{
   try{
     final isConnected=await NetworkManager.instance.isConnected();
     if(!isConnected){
       FullScreenLoader.stopLoading();
       return;
     }

     await AuthenticationRepository.instance.sendPasswordResetEmail(email);
     Loaders.successSnackBar(title: 'Email sent..',message: 'Please check your inbox'
     );
   }catch(e){
     Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
   }
 }

}