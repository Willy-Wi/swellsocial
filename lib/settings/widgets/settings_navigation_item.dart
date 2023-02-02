import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:android_development/constants/color.dart' as colors;

class SettingsNavigationItem extends StatelessWidget {
  const SettingsNavigationItem(
      {super.key,
      this.color,
      this.iconPath,
      required this.text,
      this.subtitle,
      this.page,
      this.action});

  final Color? color;
  final String? iconPath;
  final String text;
  final String? subtitle;
  final Widget? page;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: colors.dark);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Semantics(
        label: '${text} Setting Button',
        onTapHint: 'tap to open the ${text} settings page',
        child: ListTile(
            contentPadding: iconPath == null
                ? const EdgeInsets.symmetric(horizontal: 10)
                : EdgeInsets.zero,
            dense: true,
            leading: iconPath == null
                ? null
                : CircleAvatar(
                    backgroundColor: color,
                    child: SvgPicture.asset(iconPath!,
                        width: 24, color: colors.white)),
            title: Text(text, style: textTheme.titleMedium),
            subtitle: subtitle == null
                ? null
                : Text(subtitle!, style: textTheme.labelLarge),
            trailing: action,
            onTap: () => page == null
                ? null
                : Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page!))));
  }
}
