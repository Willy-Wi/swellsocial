import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        color: Colors.white,
        boxShadow: colors.boxShadow,
      ),
      child: child,
    );
  }
}
