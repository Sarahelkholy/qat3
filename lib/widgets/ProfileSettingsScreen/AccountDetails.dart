import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/UserController.dart';
import '../../Loader/Shimmer/ShimmerEffect.dart';
import '../../Screens/Profile/ProfileScreen.dart';
import '../../constants.dart';
import '../Containers/Circularimage.dart';
class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return
      ListTile(
        leading: Obx(() {
          final networkimage=controller.user.value.profilePicture;
          final image=networkimage.isNotEmpty?networkimage: 'images/logos/user.png';
          return controller.imageuploading.value? const ShimmerEffect(width: 100, height: 100,radius: 100,)
              : Circularimage(image: image,fit: BoxFit.contain,isNetworkImage:networkimage.isNotEmpty ,radius: 100,);
        }
        ),
        title:  Obx(()=> Text(controller.user.value.fullName,style:const TextStyle(color: KDarkBlue,fontSize: 16,fontWeight: FontWeight.w800),)),
        subtitle: Obx(()=> Text(controller.user.value.email,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkBlue.withOpacity(.5),fontSize: 14,fontWeight: FontWeight.w500),)),
        trailing: IconButton(onPressed: (){
          Navigator.pushNamed(context, ProfileScreen.id);
        },icon: const Icon(Icons.edit_note_rounded,color: KDarkBlue,size: 30,),),
    );
  }
}
