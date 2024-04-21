import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qat3/Controller/UserController.dart';
import 'package:qat3/Data/NetworkManager.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Loader/FullScreenLoader.dart';
import 'package:qat3/Loader/Loaders.dart';

class LoginController extends GetxController{
  final rememberme=false.obs;
  final hidePassword=true.obs;
  final localStorage=GetStorage();
  final Email=TextEditingController();
  final Password=TextEditingController();
  GlobalKey<FormState> LoginFormKey=GlobalKey<FormState>();
  final usercontroller=Get.put(UserController());


  @override
  void onInit() {
    Email.text=localStorage.read('REMEMBER_ME_EMAIL');
    Password.text=localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  void  emailAndpasswordSignin()async{

    try{
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }
      if(!LoginFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      if(rememberme.value){
        localStorage.write('REMEMBER_ME_EMAIL', Email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', Password.text.trim());

      }

   final userCredential= await AuthenticationRepository.instance.loginWithEmailandPassword(Email.text.trim(), Password.text.trim());
      AuthenticationRepository.instance.screenRedirect();
      Loaders.successSnackBar(title: 'Welcome back...',message: 'We are happy to see you again');

    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Make sure your email and password are correct');
    }
  }

  Future<void> googleSignin() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      final userCredential= await AuthenticationRepository.instance.signinwithGoogle();
      await usercontroller.saveUserRecord(userCredential);
      AuthenticationRepository.instance.screenRedirect();
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Make sure your email and password are correct');
    }

  }
}