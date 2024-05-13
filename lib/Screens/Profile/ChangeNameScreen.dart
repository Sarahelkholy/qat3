import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/UpdateNameController.dart';
import 'package:qat3/Data/Validator.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Containers/TextContainer.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(
        showBackArrow: true,
        title: 'Change Name',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Use real name for easy verification. This name will apper on several pages',
              style: TextStyle(color: KLightGray,fontSize: 15) ,),
            SizedBox(height: 18,),
            Form(
              key: controller.updateNameFormKey,
                child: Column(
                  children: [
                    TextContainer(
                      title: 'First Name',
                      controller: controller.firstname,
                        validator:(value)=> Validator.validateEmptyText('First name', value),
                        onchange: (value){}),
                    SizedBox(height: 12,),
                    TextContainer(
                        title: 'Last Name',
                        controller: controller.lastname,
                        validator:(value)=> Validator.validateEmptyText('Last name', value),
                        onchange: (value){}),
                  ],
                )),
            SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(onPressed: ()=>controller.updateName(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KDarkBlue
                  ),child: const Text('Save', style: TextStyle(color: Colors.white,fontSize: 17),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
