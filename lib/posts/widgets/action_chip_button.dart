import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';

class ActionChipButton extends StatefulWidget {
  const ActionChipButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.label});

  final String icon;
  final String label;
  final Function() onPressed;

  @override
  State<ActionChipButton> createState() => _ActionChipButtonState();
}

class _ActionChipButtonState extends State<ActionChipButton> {
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      pressElevation: 0,
      side: const BorderSide(color: colors.greyShadow, width: 0.5),
      backgroundColor: Colors.transparent,
      labelStyle: const TextStyle(fontSize: 12, color: colors.dark),
      onPressed: widget.onPressed,
      label: Row(
        children: [
          SvgPicture.asset('assets/icons/${widget.icon}.svg'),
          const SizedBox(width: 5),
          Text(widget.label),
        ],
      ),
    );
  }
}
