import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/UserController.dart';
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
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
                color: Colors.white,
                child: AccountDetails()
            ),
            Divider(color: KLightGray,endIndent: 30,indent: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 5),
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

                  SizedBox(
                    height: 40,
                    width: 200,
                    child: OutlinedButton(
                        onPressed: (){AuthenticationRepository.instance.logout();
                        }, child: const Text('Logout',style:TextStyle(color: KDarkBlue,fontSize: 17,fontWeight: FontWeight.bold) ,)),
                  )
                ],
              ),
            )
          ],
        )


      )
    );
  }
}
