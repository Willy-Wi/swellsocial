import 'package:flutter/material.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: Row(
            children: <Widget>[
              Text(count, style: textTheme.titleMedium),
              const SizedBox(width: 7),
              Text(label, style: textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}
