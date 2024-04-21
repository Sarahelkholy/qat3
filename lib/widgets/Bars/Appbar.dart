// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
   Widget? Child;
    bool showBackArrow;
    final double? height;
  final EdgeInsetsGeometry? padd;
  Appbar({super.key, required this.title, this.Child,this.padd=const EdgeInsets.only(top: 15,left: 5,bottom: 15,right: 20),this.showBackArrow=false,this.height});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      color: Colors.white,
      padding: padd,
      child: Row(
        children: [
         if(showBackArrow) InkWell(
          onTap: (){
          Navigator.pop(context);
        },
    child:const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Icon(Icons.arrow_back_ios,color: KDarkBlue,),
    ) ,
    ),
          Padding(padding: const EdgeInsets.only(left: 3),child: Text(title,style: const TextStyle(
              color: KDarkBlue,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),),
          const Spacer(),
          Container(child: Child)
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
