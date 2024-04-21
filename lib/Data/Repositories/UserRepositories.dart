import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qat3/UserModel.dart';

class UserRepoistory extends GetxController{
  static UserRepoistory get instance=>Get.find();
  final FirebaseFirestore _db=FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on FormatException catch(_){
      throw const FormatException();
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}