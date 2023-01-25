import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../services/theme_provider.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return ActionChip(
      pressElevation: 0,
      side: const BorderSide(color: colors.greyShadow, width: 0.5),
      backgroundColor: colors.greyLowOpacityBackground,
      labelStyle: textTheme.labelLarge,
      onPressed: widget.onPressed,
      label: Row(
        children: [
          SvgPicture.asset('assets/icons/${widget.icon}.svg',
              color: themeProvider.themeMode ? colors.white : colors.dark),
          const SizedBox(width: 5),
          Text(widget.label),
        ],
      ),
    );
  }
}
