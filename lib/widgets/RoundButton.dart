import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color;
  final Color Textcolor;
  final double? Width;

  const RoundButton({super.key, required this.text, required this.onPress, required this.color, required this.Textcolor,this.Width=300});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child:  Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: Width,
          child: Text(text,style: TextStyle(
              color:  Textcolor,
                  fontSize: 15
          ),)
          ,
        ),
      ),
    );
  }
}


