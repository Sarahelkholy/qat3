import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class SettingMenu extends StatelessWidget {
  final IconData icon;
  final String title,subtitle;
  final Widget? trailing;
  final VoidCallback? ontap;
  const SettingMenu({super.key, required this.icon,required this.title,required this.subtitle,this.trailing, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: KDarkBlue,),
      title: Text(title,style: const TextStyle(color: KDarkBlue,fontSize: 16,fontWeight: FontWeight.w500),),
      subtitle: Text(subtitle,style: TextStyle(color: KDarkBlue.withOpacity(.5),fontSize: 13,),),
      trailing: trailing,
      onTap: ontap,
    );
  }
}
