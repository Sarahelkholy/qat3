import 'package:flutter/material.dart';
import 'package:qat3/widgets/RoundButton.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';
import 'package:qat3/constants.dart';

class WelcomeScreen extends StatefulWidget {
 static const id='WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState  createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:KBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logos/logo4.png'),
            const SizedBox(height: 10,),
            const Text('Shop thousands of local items from your home',textAlign:TextAlign.center,style: TextStyle(
              color: KDarkestColor,
              fontSize:22,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 30,),
            const Text('Welcome to QAT3',style: TextStyle(
              color: KDarkGray,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,),


            const SizedBox(height: 30,),
            RoundButton(text: 'I\'m new here' ,color: KDarkBlue ,Textcolor:  Colors.white,onPress: (){
              Navigator.pushNamed(context,RegisterScreen.id );
            }, ),
            RoundButton(text: 'Log in',color:
               KDarkGray,Textcolor:  Colors.white,onPress: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),

          ],
        ),
      ),
    );
  }
}
