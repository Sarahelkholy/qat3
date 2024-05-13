import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qat3/Data/NetworkManager.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Data/Repositories/UserRepositories.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Screens/Profile/ReAuthLoginForm.dart';
import 'package:qat3/Screens/Start/LoginScreen.dart';
import 'package:qat3/Models/UserModel.dart';

import '../constants.dart';

class UserController extends GetxController{
  static UserController get instance=>Get.find();

//loaders
  final profileLoading=false.obs;
  final imageuploading=false.obs;

  final hidePassword=false.obs;
  final verifyEmail=TextEditingController();
  final verifyPassword=TextEditingController();

  final user=UserModel.empty().obs;
  final userRepostry=Get.put(UserRepoistory());
  GlobalKey<FormState> reAuthFormKey=GlobalKey<FormState>();
  

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value=true;
      final user =await userRepostry.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value=false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential)async {
    try{
      await fetchUserRecord();
      if(user.value.id.isEmpty){
      if(userCredential!=null){
        final namePart=UserModel.nameParts(userCredential.user!.displayName??'');
        final userName=UserModel.generateUsername(userCredential.user!.displayName??'');

        final user=UserModel(id: userCredential.user!.uid,
            firstName: namePart[0],
            lastName: namePart.length>1?namePart.sublist(1).join(''):'',
            username: userName,
            email: userCredential.user!.email??'',
            phone: userCredential.user!.phoneNumber??'',
            profilePicture: userCredential.user!.photoURL??'',
        );
        await userRepostry.saveUserRecord(user);
      }
      }
    }catch(e){
      Loaders.warningSnackBar(title: 'Data not saved',message: 'Something went wrong while saving your information.');
    }
  }

  uploadUserProfilePicture() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 550,
          maxWidth: 550);
      if (image != null) {
        imageuploading.value=true;
        final imageurl = await userRepostry.uploadImage(
            'Users/Images/Profile/', image);
        Map<String, dynamic> json = {'ProfilePicture': imageurl};
        await userRepostry.updateSingleField(json);
        user.value.profilePicture = imageurl ;
        user.refresh();
        Loaders.successSnackBar(title: 'Congratulation',message: 'Your Profile image has been updated');
      }
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
    finally{
      imageuploading.value=false;
    }
  }

  void deleteAccountWarningPopup(){
    Get.defaultDialog(

      backgroundColor:Colors.white,
      contentPadding: EdgeInsets.all(12),
      title: 'Delete Account',
      titleStyle: TextStyle(color: KDarkGray,fontSize: 19,fontWeight: FontWeight.w600),
      middleText: 'Are you sure you want to delete your account?',
        middleTextStyle: TextStyle(color: KDarkGray,fontSize: 15,),
        confirm: ElevatedButton(
        onPressed: () async=>deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: KDarkBlue
        ),child: const Text('Delete', style: TextStyle(color: Colors.white,fontSize: 15),),),
        cancel: OutlinedButton(onPressed: ()=>Navigator.of(Get.overlayContext!).pop,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white
          ),
          child: const Text('Cancel',style: TextStyle(color: KDarkBlue,fontSize: 15),))
    );
  }

  void deleteUserAccount() async{
    try{
      final auth=AuthenticationRepository.instance;
      final provider =auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider=='google.com'){
          await auth.signinwithGoogle();
          await auth.deleteAccount();
          Get.offAll(()=>LoginScreen());
        }
        else if(provider=='password'){
          Get.to(()=>ReAuthLoginForm());
        }
      }
    }catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
    }

  }

  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      final isConnected= await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }
      if(!reAuthFormKey.currentState!.validate()){
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      Get.offAll(()=>LoginScreen());
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
    }
  }
}