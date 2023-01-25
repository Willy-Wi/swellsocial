import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:provider/provider.dart';

import '../services/theme_provider.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.label,
      this.useAccentColor = false,
      required this.onTap});

  final String label;
  final Function() onTap;
  final bool useAccentColor;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: useAccentColor ? colors.purpleGreenGradient : null,
        color: useAccentColor
            ? null
            : themeProvider.isDarkMode
                ? colors.darkBackground
                : colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: themeProvider.isDarkMode ? null : colors.greyBoxShadow,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          foregroundColor: useAccentColor
              ? colors.white
              : themeProvider.isDarkMode
                  ? colors.white
                  : colors.purple,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onTap,
        child: Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}
