import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/ProfileMenu.dart';
import 'package:qat3/widgets/SectionHeading.dart';

class ProfileScreen extends StatelessWidget {
  static const id='ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title:'Profile',showBackArrow: true,height: 80, padd: const EdgeInsets.only(top: 30),),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: KLightGray,
                  child: Image.asset('images/logos/user.png',width: 37,height: 37,),
                ),
                TextButton(onPressed: (){}, child: const Text('Change profile photo',style: TextStyle(color: KDarkBlue),))
              ],
            ),
          ),
          const Divider(color: KLightGray,endIndent: 60,indent: 60,),
          const SectionHeading(title: 'Profile informations',showButton: false,),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: KBackground.withOpacity(.5),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    ProfileMenu(title: 'Name', value: 'Sarah ELkholy', ontap: (){}),
                    ProfileMenu(title: 'UserNAme', value: 'Sarah_Elkholy', ontap: (){})

                  ],
                ),
              ),
            ),
          ),
          const SectionHeading(title: 'Personal informations',showButton: false,),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: KBackground.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    ProfileMenu(title: 'UserID', value: '4860', ontap: (){}),
                    ProfileMenu(title: 'E-mail', value: 'Sarah@gmail.com', ontap: (){}),
                    ProfileMenu(title: 'Phone number', value: '+201008637092', ontap: (){}),
                    ProfileMenu(title: 'Gender', value: 'Female', ontap: (){}),
                    ProfileMenu(title: 'Date of birth', value: '30/7/2003', ontap: (){}),

                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height:15),
          Center(child: TextButton(onPressed:(){},
              child:const Text('Close account',style: TextStyle(color: KDarkBlue,fontWeight: FontWeight.bold),),
          ),
          )
        ],
      ),
    );
  }
}
