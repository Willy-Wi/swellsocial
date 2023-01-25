import 'package:android_development/settings/widgets/settings_navigation_item.dart';
import 'package:android_development/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:provider/provider.dart';
import '../../services/theme_provider.dart';
import '../../widgets/back_button.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Themes'),
            ),
            Expanded(
              child: Background(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                child: Column(
                  children: <Widget>[
                    SettingsNavigationItem(
                      text: 'Dark Mode',
                      action: Switch(
                          value: themeProvider.isDarkMode,
                          activeTrackColor: colors.greenDarker,
                          activeColor: colors.green,
                          onChanged: (value) {
                            themeProvider.swapTheme();
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
