import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/Models/AddressModel.dart';
import 'package:qat3/constants.dart';
class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback ontap;
  const AddressCard({super.key, required this.address,required this.ontap});

  @override
  Widget build(BuildContext context) {
    final controller=AddressController.instance;
    return Obx((){
      final selectedAddressId=controller.selectedAddress.value.id;
      final selected=selectedAddressId==address.id;
      return  InkWell(
       // onLongPress:()=> controller.removeOne(controller.selectedAddress.value) ,
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                border:selected?Border.all(color:KDarkGray ):Border.all(color: KLightGray.withOpacity(.4)) ,
                borderRadius: BorderRadius.circular(20),
                color: selected? KBackground.withOpacity(.5):Colors.white
            ),
            margin: const EdgeInsets.only(bottom: 14),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selected?Icons.check_circle:null,
                    color: selected?KDarkBlue.withOpacity(.6):null,
                  ),
                ),
                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold),),
                    SizedBox(height: 4,),
                    Text(address.phone,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkestColor),),
                    SizedBox(height: 4,),
                    Text(address.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkestColor),),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    );
  }
}
