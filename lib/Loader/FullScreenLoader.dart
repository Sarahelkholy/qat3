import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/constants.dart';
import 'AnimationLoader.dart';

class FullScreenLoader{
  static void openLoadingDialog(String text,String animation){
    showDialog(context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_)=>PopScope(
       canPop:false,
      child: Container(
        color: KLightGray,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 250,),
            AnimationLoader(text: text, animation: animation,)
          ],
        ),
      ),
        )
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
