import 'package:android_development/settings/widgets/settings_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import '../../services/firestore_service.dart';
import '../../widgets/back_button.dart';
import '../../widgets/background.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  bool isSwitched = false;
  TextEditingController displayNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Account'),
            ),
            Expanded(
              child: Background(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                child: Column(
                  children: <Widget>[
                    SettingsNavigationItem(
                      text: '2-Factor Authentication',
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
                    SettingsNavigationItem(
                      text: 'Change Password',
                      action: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                                width: 1, color: colors.purpleShadow),
                          ),
                        ),
                        child: const Text('Change',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const Divider(),
                    SettingsNavigationItem(
                      text: 'Display Name',
                      action: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        width: 200,
                        child: TextField(
                          controller: displayNameController,
                          style: const TextStyle(
                              fontSize: 15,
                              color: colors.purple,
                              fontWeight: FontWeight.w400),
                          cursorWidth: 1,
                          cursorColor: colors.purple,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.greyLowOpacityBackground)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.greyLowOpacityBackground)),
                            suffixIcon: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: colors.purple),
                              onPressed: () {
                                FirestoreService().updateUser(
                                    context, displayNameController.text, () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Display Name Successfully Updated')));
                                });
                              },
                              child: const Text('SAVE',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ),
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
