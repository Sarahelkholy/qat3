import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qat3/constants.dart';
class ProfileMenu extends StatelessWidget {
  final String title,value;
  final Widget icon;
  final VoidCallback onpressed;
  const ProfileMenu({super.key, required this.title,required this.value,this.icon=const Icon(Icons.arrow_forward_ios_outlined),required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6,left: 10,right: 5),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,bottom: 3),
        child: Row(
          children: [
            Expanded(flex:4,child: Text(title,style: TextStyle(color: KDarkGray,fontSize: 15,fontWeight: FontWeight.w500),)),
            Expanded(flex: 9,child: Text(value,style:  TextStyle(color: KDarkBlue,fontSize: 15,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),)),
            Expanded(child: IconButton(icon: icon,color: KDarkBlue,iconSize: 16,onPressed: onpressed,))
          ],
        ),
      ),
    );
  }
}
