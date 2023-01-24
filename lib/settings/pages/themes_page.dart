import 'package:android_development/settings/widgets/settings_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import '../../widgets/back_button.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Themes'),
            ),
            Expanded(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(25)),
                      boxShadow: colors.boxShadow),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: Column(
                      children: <Widget>[
                        SettingsNavigationItem(
                          text: 'Dark Mode',
                          action: Switch(
                              value: isSwitched,
                              activeTrackColor: colors.greenDarker,
                              activeColor: colors.green,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              }),
                        ),
                        const Divider(),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
