import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/constants.dart';

class Loaders{
  static hideSnackBar()=>ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(elevation: 0,
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: KLightGray
            ),
            child: Center(child: Text(message,style: TextStyle(color: KDarkBlue,fontSize: 12),),),
          ))
    );
  }

  static successSnackBar({required title,message='',duration=3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: KDarkBlue,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check,color: Colors.white,)
    );
  }

  static warningSnackBar({required title,message='',duration=3}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: KDarkBlue,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Icons.dangerous,color: Colors.white,)
    );
  }
  static errorSnackBar({required title,message=''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: KDarkGray,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Icons.dangerous,color: Colors.white,)
    );
  }
}