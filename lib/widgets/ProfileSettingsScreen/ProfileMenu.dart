import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class ProfileMenu extends StatelessWidget {
  final String title,value;
  final IconData icon;
  final VoidCallback ontap;
  const ProfileMenu({super.key, required this.title,required this.value,this.icon=Icons.arrow_forward_ios_outlined,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 5),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,bottom: 3),
          child: Row(
            children: [
              Expanded(flex:3,child: Text(title,style: TextStyle(color: KDarkBlue.withOpacity(.5),fontSize: 15),)),
              Expanded(flex:5,child: Text(value,style: const TextStyle(color: KDarkBlue,fontSize: 15),)),
              Expanded(child: Icon(icon,color: KDarkBlue,size: 16,))
            ],
          ),
        ),
      ),
    );
  }
}
