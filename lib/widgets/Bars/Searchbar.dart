import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class Searchbar extends StatelessWidget {
  final Color color;
  const Searchbar({super.key, this.color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              child: TextFormField(
                cursorColor: KDarkBlue,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search here....',
                ),
              ),
            ),
          ),
          const Spacer(),
          const Icon(Icons.search, color: KLightGray, size: 24,),
        ],
      ),
    );
  }
}