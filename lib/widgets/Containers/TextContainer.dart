import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

class TextContainer extends StatelessWidget {
 final String title;
 final void Function(String) onchange;
 final bool scure;
 final String? hint;
 final TextEditingController? controller;
 final validator;
 final suffix;
 const TextContainer({super.key,  this.title='',required this.onchange, this.scure=false,this.hint, this.controller,this.validator,this.suffix});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:const TextStyle(
      color: KDarkestColor,
          fontSize: 15,
          fontWeight: FontWeight.w500

    ) ,),
    const SizedBox(height: 9),
    TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: KDarkestColor,
      obscureText: scure,
    style: const TextStyle(
    color: Colors.black
    ),
    keyboardType: TextInputType.emailAddress,
    onChanged: onchange,
     decoration: InputDecoration(
       suffixIcon: suffix,
      hintText:hint ,
      hintStyle: TextStyle(color: KDarkestColor.withOpacity(.5)),
       filled: true,
    fillColor: Colors.white,
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 20.0),
    border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: KBackground, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: KLightGray, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    ),
    )
      ],
    ) ;

  }
}
