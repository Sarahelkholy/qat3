import 'package:flutter/material.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';

import '../../../constants.dart';
class AddNewAddress extends StatelessWidget {
  static const id='AddNewAddress';

  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  Appbar(title: 'Add new address',showBackArrow: true,height: 85,padd: const EdgeInsets.only(top: 35),),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8,bottom: 5),
          child: Form(
            child: Column(
              children: [
                TextContainer(hint: 'Name', onchange: (value){}),
                TextContainer(hint: 'Phone',onchange: (value){}),
                Row(
                  children: [
                    Expanded(child: TextContainer(hint: 'City',onchange: (value){})),
                    const SizedBox(width: 4,),
                    Expanded(child: TextContainer(hint: 'Street',onchange: (value){})),
                  ],
                ),
                TextContainer(hint: 'Country',onchange: (value){}),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: (){},style: ElevatedButton.styleFrom(
                      backgroundColor: KDarkBlue,
                  ),child: const Text('Save',style: TextStyle(color: Colors.white,fontSize: 16),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
