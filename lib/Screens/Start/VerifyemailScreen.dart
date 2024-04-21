import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/VerifyController.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/constants.dart';

class VerifyemailScreen extends StatelessWidget {
  final String? email;
  const VerifyemailScreen({this.email});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VerifyController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=>AuthenticationRepository.instance.logout(),
            icon: Icon(CupertinoIcons.clear,color: KDarkBlue,))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
          child: Column(
            children: [
              //image
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('images/verifyemail.png'),
              ),
              SizedBox(height: 16,),
              //verify
              Text('Verify your email address!',
                style: TextStyle(color: KDarkBlue,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 5,),
              Text(email??'',
                style: TextStyle(color: KDarkGray,fontSize: 15),textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('Congratulations your account await: Verify Your email to start shopping and experience a world of unrivaled deals and Personalized offers '
                  ,style: TextStyle(color: KDarkGray.withOpacity(.5),fontSize: 14),
                  textAlign: TextAlign.center
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>controller.checkEmailVerification()
                  ,child: Text('Continue', style: TextStyle(color: Colors.white,fontSize: 15),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KDarkBlue
                  ),),
              ),
              SizedBox(height: 8,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>controller.sendEmailVerification()
                  ,child: Text('Resend email', style: TextStyle(color: KDarkBlue,fontSize: 16),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                  ),),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
