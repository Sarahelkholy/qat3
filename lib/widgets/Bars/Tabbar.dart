import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class Tabbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> taps;
  const Tabbar({super.key, required this.taps});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        tabs: taps,
        isScrollable: true,
        indicatorColor: KLightGray,
        labelColor: KDarkBlue,
        unselectedLabelColor: KDarkGray,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
