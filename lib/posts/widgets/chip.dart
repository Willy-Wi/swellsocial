import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

class CustomChip extends StatelessWidget {
  const CustomChip(
      {super.key,
      required this.count,
      required this.label,
      required this.onTap});

  final String count;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: colors.dark, fontSize: 14);
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      color: colors.greyBackground,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: Row(
            children: <Widget>[
              Text(count,
                  style: textStyle.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(width: 7),
              Text(label,
                  style: textStyle.copyWith(fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
