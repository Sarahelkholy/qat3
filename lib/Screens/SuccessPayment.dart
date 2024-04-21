import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

import '../widgets/NavigationMenu.dart';
class SuccessPayment extends StatelessWidget {
  static const id='SuccessPayment';
  const SuccessPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const SizedBox(height: 150,),
          Image.asset('images/done.png',height: 290,width: 400,),
          const SizedBox(height: 15,),
          const Text('Payment success!',style: TextStyle(color: KDarkBlue,fontWeight: FontWeight.bold,fontSize: 29),),
          const SizedBox(height: 8,),
          Text('Your items will be shipped soon',style: TextStyle(color: KDarkBlue.withOpacity(.4),fontSize: 15),),
          const SizedBox(height: 16,),
          SizedBox(
            height: 40,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, NavigationMenu.id);},
              style: ElevatedButton.styleFrom(
                  backgroundColor: KDarkBlue,
              ),
                child: const Text('Continue shopping',style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
