import 'package:flutter/material.dart';
import 'package:qat3/Screens/Profile/Address/AddNewAddress.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/AddressCard.dart';
class AddressScreen extends StatelessWidget {
  static const id='AddressScreen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  Appbar(title: 'Address',showBackArrow: true,height: 75,padd: const EdgeInsets.only(top: 35),),
      floatingActionButton:  FloatingActionButton(onPressed: (){Navigator.pushNamed(context, AddNewAddress.id);},
        backgroundColor: KDarkBlue,
        child: const Icon(Icons.add,size: 25,color: Colors.white,),),
        body:const SingleChildScrollView(
        child: Padding(
         padding: EdgeInsets.all(8.0),
         child: Column(
         children: [
           AddressCard(selected: false),
           AddressCard(selected: true),
           AddressCard(selected: false),
           AddressCard(selected: false),

         ],
         ),
        ),
      ),
    );
  }
}
