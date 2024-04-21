import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/constants.dart';

class Loaders{
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