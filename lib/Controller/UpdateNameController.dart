import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/UserController.dart';
import 'package:qat3/Data/Repositories/UserRepositories.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Screens/Profile/ProfileScreen.dart';

import '../Data/NetworkManager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance=>Get.find();

  final firstname=TextEditingController();
  final lastname=TextEditingController();
  final userController=UserController.instance;
  final userRepository=Get.put(UserRepoistory());
  GlobalKey<FormState> updateNameFormKey=GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializeName();
  }

  Future<void> initializeName() async{
    firstname.text=userController.user.value.firstName;
    lastname.text=userController.user.value.lastName;
  }

  Future<void> updateName() async{
    try{
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if(!updateNameFormKey.currentState!.validate()){
        return;
      }

      Map<String,dynamic> name={'FirstName':firstname.text.trim(),'LastName':lastname.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName=firstname.text.trim();
      userController.user.value.lastName=lastname.text.trim();

      Loaders.successSnackBar(title: 'Congratulations',message: 'Your name has been updated.');

      Get.off(()=>const ProfileScreen());
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
    }
  }

}