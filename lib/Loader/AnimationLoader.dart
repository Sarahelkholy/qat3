import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qat3/constants.dart';

class AnimationLoader extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  const AnimationLoader({super.key, required this.text, required this.animation,  this.showAction=false, this.actionText, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,width: MediaQuery.of(context).size.width*.8),
          const SizedBox(height: 24,),
          Text(text,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500) ,
          textAlign: TextAlign.center,),
          const SizedBox(height: 24,),
          showAction?
              SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(backgroundColor: KDarkBlue),
                  child: Text(actionText!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                ),
              )
              :const SizedBox(),
        ],
      ),
    );
  }
}
