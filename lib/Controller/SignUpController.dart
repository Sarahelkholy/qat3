import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qat3/Data/NetworkManager.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Data/Repositories/UserRepositories.dart';
import 'package:qat3/Loader/FullScreenLoader.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Screens/Start/VerifyemailScreen.dart';
import 'package:qat3/Models/UserModel.dart';

class SignUpController extends GetxController{
static SignUpController get instance=>Get.find();
final hidePassword=true.obs;
final FirstName=TextEditingController();
final LastName=TextEditingController();
final UserName=TextEditingController();
final Email=TextEditingController();
final Password=TextEditingController();
final Phone=TextEditingController();
GlobalKey<FormState> SignUpFormKey=GlobalKey<FormState>();

void Signup() async{
  try{
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      return;
    }

    if(!SignUpFormKey.currentState!.validate()){
        return;
    }

   final userCredintial= await AuthenticationRepository.instance.registerWithEmailandPassword(Email.text.trim(), Password.text.trim());

    final newUser=UserModel(id: userCredintial.user!.uid,
        firstName: FirstName.text.trim(),
        lastName: LastName.text.trim(),
        username: UserName.text.trim(),
        email: Email.text.trim(),
        phone: Phone.text.trim(),
        profilePicture: ''
    );

    final userRepository=Get.put(UserRepoistory());
    await userRepository.saveUserRecord(newUser);
    FullScreenLoader.stopLoading();
    Loaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created');
    Get.to(()=> VerifyemailScreen(email:Email.text.trim()));

  }
  catch(e){
    FullScreenLoader.stopLoading();
    Loaders.errorSnackBar(title: 'Opps....!',message: e.toString());
  }
}
}