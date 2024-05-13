import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/Screens/Profile/Address/AddNewAddress.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/AddressCard.dart';
class AddressScreen extends StatelessWidget {
  static const id='AddressScreen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AddressController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  Appbar(title: 'Address',showBackArrow: true,height: 75,padd: const EdgeInsets.only(top: 35),),
      floatingActionButton:  FloatingActionButton(onPressed: (){Navigator.pushNamed(context, AddNewAddress.id);},
        backgroundColor: KDarkBlue,
        child:  Icon(Icons.add,size: 25,color: Colors.white,),),
        body: SingleChildScrollView(
        child: Padding(
         padding: EdgeInsets.all(8.0),
         child: Obx(()=>
           FutureBuilder(
             key: Key(controller.refreshData.value.toString()),
             future:controller.allUserAddresses() ,
             builder: (context, snapshot) {
               final response=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
               if(response!=null) return response;
               final addresses=snapshot.data!;
               return ListView.builder(
                 shrinkWrap: true,
                   itemCount: addresses.length,
                   itemBuilder: (_,index)=>AddressCard(address: addresses[index],
                     ontap: ()=>controller.selecteAddress(addresses[index]),),
               );
             }
           ),
         ),
        ),
      ),
    );
  }
}
