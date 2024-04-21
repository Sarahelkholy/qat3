import 'package:flutter/material.dart';

import '../../constants.dart';
class CoponContainer extends StatelessWidget {
  const CoponContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Discount code',
        hintStyle: TextStyle(color: KLightGray,fontSize: 15),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white
      ),
      cursorColor: KDarkBlue,
    );
  }
}
