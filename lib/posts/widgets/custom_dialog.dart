import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../authentication/models/user_model.dart';
import '../../authentication/services/auth.dart';
import '../../services/firestore_service.dart';
import '../../services/theme_provider.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      insetPadding: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: CircleAvatar(
                  radius: 25,
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: colors.purpleGreenGradient))),
              title: StreamBuilder<QuerySnapshot>(
                stream:
                    FirestoreService().getUser(AuthService().getCurrentUserId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = UserModel.fromJson(snapshot.data!.docs[0]);

                    return Text(
                      user.username,
                      style: textTheme.titleMedium,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}',
                        style: textTheme.titleMedium);
                  } else {
                    return Container();
                  }
                },
              ),
              subtitle: StreamBuilder(
                stream:
                    FirestoreService().getUser(AuthService().getCurrentUserId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = UserModel.fromJson(snapshot.data!.docs[0]);

                    return Text(
                      '@${user.username}',
                      style: textTheme.labelLarge,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}',
                        style: textTheme.labelLarge);
                  } else {
                    return Container();
                  }
                },
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const SizedBox(height: 5),
            const Divider(),
            Semantics(
              label: 'Notifactions button',
              onTapHint: 'Tap To View The Notifications Page',
              child: DialogListTile(
                  icon: 'notification',
                  text: 'Notifications',
                  onTap: () => Navigator.pushNamed(context, '/notification')),
            ),
            Semantics(
              label: 'Favorites button',
              onTapHint: 'Tap To View The Favorites Page',
              child: DialogListTile(
                  icon: 'like_false',
                  text: 'Favorites',
                  onTap: () {
                    Navigator.pushNamed(context, '/favorites');
                  }),
            ),
            Semantics(
              label: 'settings button',
              onTapHint: 'Tap To View The Settings Page',
              child: DialogListTile(
                  icon: 'settings',
                  text: 'Settings',
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  }),
            ),
            Semantics(
              label: 'log out button',
              onTapHint: 'Tap To Log Out',
              child: DialogListTile(
                  icon: 'logout',
                  redText: true,
                  text: 'Logout',
                  onTap: () {
                    Navigator.pop(context);
                    AuthService().signOut(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class DialogListTile extends StatelessWidget {
  const DialogListTile(
      {super.key,
      required this.icon,
      this.redText = false,
      required this.text,
      required this.onTap});

  final String icon;
  final Function() onTap;
  final bool redText;
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return ListTile(
        visualDensity: const VisualDensity(vertical: -1),
        leading: SvgPicture.asset('assets/icons/$icon.svg',
            width: 24,
            color: redText
                ? colors.redWarning
                : themeProvider.isDarkMode
                    ? colors.white
                    : colors.dark),
        title: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: redText
                  ? colors.redWarning
                  : themeProvider.isDarkMode
                      ? colors.white
                      : colors.dark),
        ),
        onTap: onTap);
  }
}
