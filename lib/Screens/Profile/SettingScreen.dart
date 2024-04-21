import 'package:flutter/material.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Screens/Profile/Address/AddressScreen.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/AccountDetails.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/SettingMenu.dart';
import 'package:qat3/widgets/SectionHeading.dart';

import '../CartScreen.dart';
import 'Orders/OrderScreen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
        Container(
        color: Colors.white,
        child: const AccountDetails()
    ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: KBackground.withOpacity(.5),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(35),
                topLeft: Radius.circular(35))
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SectionHeading(title: 'Account Settings',showButton: false,),
                    const SizedBox(height: 6,),
                    SettingMenu(icon: Icons.home,title: 'My Addresses',subtitle: 'Set shopping delivery address',ontap: (){
                      Navigator.pushNamed(context, AddressScreen.id);
                    },),
                    SettingMenu(icon: Icons.shopping_cart,title: 'My Cart',subtitle: 'Add, remove products and move to checkout',ontap: (){
                      Navigator.pushNamed(context, CartScreen.id);
                    },),
                    SettingMenu(icon: Icons.shopping_bag_rounded,title: 'My orders',subtitle: 'In-progress and completed orders',ontap: (){
                      Navigator.pushNamed(context, OrderScreen.id);
                    },),
                    const SettingMenu(icon: Icons.security,title: 'Account privacy',subtitle: 'Manage data usage and connected accounts'),

                    const SizedBox(height: 13,),
                    const SectionHeading(title: 'App Settings',showButton: false,),
                    const SizedBox(height: 6,),
                    const SettingMenu(icon: Icons.cloud_upload_rounded,title: 'Load data',subtitle: 'Upload data to your cloud firebase'),
                    SettingMenu(icon: Icons.location_on,title: 'Geolocation',subtitle: 'Set recommendations based on location',trailing: Switch(inactiveThumbColor: KDarkBlue,inactiveTrackColor: Colors.white,activeColor:KDarkBlue,value: false, onChanged: (value){}),),
                    SettingMenu(icon: Icons.security_update_good,title: 'Safe mode',subtitle: 'Search results are safe for all ages',trailing: Switch(inactiveThumbColor: KDarkBlue,inactiveTrackColor: Colors.white,activeColor:KDarkBlue,value: true, onChanged: (value){})),
                    SettingMenu(icon: Icons.image,title: 'HD image quality',subtitle: 'Set image quality to be seen',trailing: Switch(inactiveThumbColor: KDarkBlue,inactiveTrackColor: Colors.white,activeColor:KDarkBlue,value: false, onChanged: (value){})),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: OutlinedButton(
                          onPressed: (){AuthenticationRepository.instance.logout();
                          }, child: const Text('Logout',style:TextStyle(color: KDarkBlue,fontSize: 17,fontWeight: FontWeight.bold) ,)),
                    )
                  ],
                ),
              ),
            ),
          )
      ],
      )
    );
  }
}
