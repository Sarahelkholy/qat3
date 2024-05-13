import 'package:flutter/material.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/Data/Validator.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';

import '../../../constants.dart';
class AddNewAddress extends StatelessWidget {
  static const id='AddNewAddress';

  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=AddressController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  Appbar(title: 'Add new address',showBackArrow: true,height: 85,padd: const EdgeInsets.only(top: 35),),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8,bottom: 5,top: 18),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextContainer(controller: controller.name,
                    validator:(value)=> Validator.validateEmptyText('Name', value),
                    hint: 'Name', onchange: (value){
                    }),
                TextContainer(
                  controller:controller.phone,
                    validator:(value)=> Validator.validatePhone(value),
                    hint: 'PhoneNumber',onchange: (value){
                }),
                Row(
                  children: [
                    Expanded(child: TextContainer(controller: controller.city,
                        validator: (value)=>Validator.validateEmptyText('City', value),
                        hint: 'City',onchange: (value){
                    })),
                    const SizedBox(width: 4,),
                    Expanded(child: TextContainer(
                      controller: controller.street,
                        validator: (value)=>Validator.validateEmptyText('Street', value),
                        hint: 'Street',onchange: (value){
                    })),
                  ],
                ),
             //   TextContainer(hint: 'Country',onchange: (value){}),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: ()=>controller.addNewAddress(),style: ElevatedButton.styleFrom(
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
