import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:provider/provider.dart';

import '../services/theme_provider.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        color: themeProvider.themeMode ? colors.darkBackground : colors.white,
        boxShadow: colors.boxShadow,
      ),
      child: child,
    );
  }
}
