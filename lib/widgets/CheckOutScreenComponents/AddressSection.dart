import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/SectionHeading.dart';
class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=AddressController.instance;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        SectionHeading(title: 'Shipping address',buttontitle: 'Change',padd: EdgeInsets.zero,onPress: ()=>controller.selecteNewAddressPopup(context),),

        Obx(()=>
         controller.selectedAddress.value.id.isNotEmpty?
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2,),
              Text(controller.selectedAddress.value.name,style: TextStyle(color: KDarkestColor,fontSize: 16,fontWeight: FontWeight.w400),),
              SizedBox(height: 6,),
              Row(
                children: [
                  Icon(Icons.phone,color: KDarkestColor,),
                  SizedBox(width: 6,),
                  Text(controller.selectedAddress.value.phone,style: TextStyle(color: KDarkestColor,fontSize: 15,fontWeight: FontWeight.w400))
                ],
              ),
              SizedBox(height: 6,),
              Row(
                children: [
                  Icon(Icons.location_on,color: KDarkestColor,),
                  SizedBox(width: 6,),
                  Text('${controller.selectedAddress.value.city},${controller.selectedAddress.value.street}',style: TextStyle(color: KDarkestColor,fontSize: 15,fontWeight: FontWeight.w600))
                ],
              )

            ],
          ):Text('Select Address',style: TextStyle(color: KDarkBlue),),
        )
      ],
    );
  }
}
