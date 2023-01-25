import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../services/theme_provider.dart';

class Back extends StatelessWidget {
  const Back({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color:
                themeProvider.themeMode ? colors.darkBackground : colors.white,
            shape: BoxShape.circle,
            boxShadow: themeProvider.themeMode
                ? null
                : colors.greyBoxShadow,
          ),
          child: Material(
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
                overlayColor:
                    MaterialStateProperty.all(colors.purpleSplashRipple),
                splashColor: colors.purpleSplashRipple,
                customBorder: const CircleBorder(),
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/icons/back_gradient.svg',
                      width: 24),
                )),
          ),
        ),
        const SizedBox(width: 15),
        Text(label ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colors.purple,
            )),
      ],
    );
  }
}
