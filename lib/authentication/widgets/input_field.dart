import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(1, 2),
            color: colors.greyShadow,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          obscureText: widget.obscureText,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: colors.purple),
          controller: widget.controller,
          cursorColor: colors.purple,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SvgPicture.asset(widget.iconPath, width: 24),
            ),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: colors.grey),
          ),
        ),
      ),
    );
  }
}
