import 'package:flutter/material.dart';

import '../../constants.dart';
class Iconsbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackArrow;
  final Widget?title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  const Iconsbar({super.key, this.showBackArrow=false,this.leadingIcon,this.title,this.actions});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ?IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios,color: KDarkBlue,))
            :leadingIcon!=null?
        IconButton(onPressed: (){}, icon:
        Icon(leadingIcon)):null,
        title: title,
        actions: actions,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


}