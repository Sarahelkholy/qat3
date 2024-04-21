import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'dart:async';

class VerifyController extends GetxController{
static VerifyController get instance=>Get.find();

@override
  void onInit() {
  sendEmailVerification();
  setTimerForAutoRedirect();
  super.onInit();
  }

sendEmailVerification() async{
  try{
    await AuthenticationRepository.instance.sendEmailVerification();
    Loaders.successSnackBar(title: 'Email sent..',message: 'Please check your inbox');
  }
  catch(e){
    Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
  }
}

setTimerForAutoRedirect() async{
  Timer.periodic(const Duration(seconds: 1)
      , (timer) async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user=FirebaseAuth.instance.currentUser;
    if(user?.emailVerified??false){
      timer.cancel();
      AuthenticationRepository.instance.screenRedirect();
    }
          });
}

checkEmailVerification() async{
  final currentUser=FirebaseAuth.instance.currentUser;
  if(currentUser!=null&&currentUser.emailVerified){
    AuthenticationRepository.instance.screenRedirect();
  }
}
}