import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/UserController.dart';
import 'package:qat3/Loader/Shimmer/ShimmerEffect.dart';
import 'package:qat3/Screens/Profile/ChangeNameScreen.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';
import 'package:qat3/widgets/Containers/Circularimage.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/ProfileMenu.dart';
import 'package:qat3/widgets/SectionHeading.dart';

class ProfileScreen extends StatelessWidget {
  static const id='ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title:'Profile',showBackArrow: true,height: 80, padd: const EdgeInsets.only(top: 30),),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Obx(() {
                  final networkimage=controller.user.value.profilePicture;
                  final image=networkimage.isNotEmpty?networkimage: 'images/logos/user.png';
                  return controller.imageuploading.value? const ShimmerEffect(width: 80, height: 80,radius: 80,)
                   : Circularimage(image: image,width: 100,height: 100,isNetworkImage:networkimage.isNotEmpty ,radius: 100,);
                }
                ),
                TextButton(onPressed: ()=>controller.uploadUserProfilePicture(), child: const Text('Change profile photo',style: TextStyle(color: KDarkBlue),))
              ],
            ),
          ),
          const Divider(color: KLightGray,endIndent: 60,indent: 60,),
          const SectionHeading(title: 'Profile information',showButton: false,),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: KBackground.withOpacity(.5),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Obx(()=>
                     Column(
                    children: [
                      ProfileMenu(title: 'Name : ', value:controller.user.value.fullName, onpressed: ()=>Get.to(()=>ChangeNameScreen())),
                      ProfileMenu(title: 'UserName : ', value: controller.user.value.username, onpressed: ()=>Get.to(()=>ChangeNameScreen()))

                    ],
                  ),
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
                    ProfileMenu(title: 'UserID : ', value: controller.user.value.id,onpressed: (){},),
                    ProfileMenu(title: 'E-mail : ', value: controller.user.value.email,onpressed: (){}),
                    ProfileMenu(title: 'Phone : ', value:controller.user.value.phone,onpressed: (){},),


                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height:15),
          Center(child: TextButton(onPressed:()=>controller.deleteAccountWarningPopup(),
              child:const Text('Close account',style: TextStyle(color: KDarkBlue,fontWeight: FontWeight.bold),),
          ),
          )
        ],
      ),
    );
  }
}
