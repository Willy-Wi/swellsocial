import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../services/theme_provider.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.iconPath,
      this.obscureText = false});

  final TextEditingController controller;
  final String hintText;
  final String iconPath;
  final bool obscureText;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? colors.darkBackground : colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: themeProvider.isDarkMode ? null : colors.greyBoxShadow,
      ),
      child: Center(
        child: TextField(
          obscureText: widget.obscureText,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: themeProvider.isDarkMode ? colors.white : colors.purple),
          controller: widget.controller,
          cursorColor: themeProvider.isDarkMode ? colors.white : colors.purple,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SvgPicture.asset(widget.iconPath,
                  width: 24,
                  color: themeProvider.isDarkMode ? colors.white : colors.dark),
            ),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: themeProvider.isDarkMode
                    ? const Color.fromARGB(255, 160, 160, 160)
                    : colors.grey),
          ),
        ),
      ),
    );
  }
}
