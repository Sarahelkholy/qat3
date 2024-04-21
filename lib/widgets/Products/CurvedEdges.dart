import 'package:flutter/material.dart';

import 'CustomCurvedEdges.dart';

class CurvedEdges extends StatelessWidget {
  final Widget child;
  const CurvedEdges({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
