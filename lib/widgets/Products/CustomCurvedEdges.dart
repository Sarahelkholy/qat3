import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0, 470);
    const firstCurved=Offset(0, 450);
    const lastCurved=Offset(30,   450);
    path.quadraticBezierTo(firstCurved.dx, firstCurved.dy, lastCurved.dx, lastCurved.dy);

    const SecondFirstCurved=Offset(0,  450);
    const SecondLastCurved=Offset(370,  450);
    path.quadraticBezierTo(SecondFirstCurved.dx, SecondFirstCurved.dy, SecondLastCurved.dx, SecondLastCurved.dy);

    const ThirdFisrtCurved=Offset(400,  450);
    const ThirdLastCurved=Offset(400, 470);
    path.quadraticBezierTo(ThirdFisrtCurved.dx, ThirdFisrtCurved.dy, ThirdLastCurved.dx, ThirdLastCurved.dy);

    path.lineTo(400, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    throw true;
  }

}