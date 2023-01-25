import 'package:android_development/settings/pages/accounts_page.dart';
import 'package:android_development/settings/pages/notification_setting_page.dart';
import 'package:android_development/settings/pages/themes_page.dart';
import 'package:android_development/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../../widgets/back_button.dart';
import '../widgets/settings_navigation_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Settings'),
            ),
            Expanded(
              child: Background(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 25.0, right: 25.0),
                    child: Column(children: const [
                      SettingsNavigationItem(
                          color: colors.purple,
                          iconPath: 'assets/icons/profile_circle.svg',
                          text: 'Account',
                          subtitle: 'Password - 2 Factor Authentication',
                          page: AccountsPage()),
                      Divider(),
                      SettingsNavigationItem(
                          color: colors.greenDarker,
                          iconPath: 'assets/icons/notification.svg',
                          text: 'Notification',
                          subtitle: 'Push Notification',
                          page: NotificationSettingPage()),
                      Divider(),
                      SettingsNavigationItem(
                          color: colors.redWarning,
                          iconPath: 'assets/icons/palette.svg',
                          text: 'Themes',
                          subtitle: 'Dark Mode',
                          page: ThemesPage()),
                      Divider(),
                    ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
