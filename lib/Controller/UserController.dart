import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/UserRepositories.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/UserModel.dart';

class UserController extends GetxController{
  static UserController get instance=>Get.find();
  final userRepostry=Get.put(UserRepoistory());
  Future<void> saveUserRecord(UserCredential? userCredential)async {
    try{
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
    }catch(e){
      Loaders.warningSnackBar(title: 'Data not saved',message: 'Something went wrong while saving your information.');
    }
  }
}