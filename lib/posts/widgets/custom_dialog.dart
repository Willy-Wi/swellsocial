import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';

import '../../authentication/models/user_model.dart';
import '../../authentication/services/auth.dart';
import '../../services/firestore_service.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: colors.dark);

    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      insetPadding: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
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
                      style: textStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}',
                        style: textStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w600));
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
                      style: textStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}',
                        style: textStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400));
                  } else {
                    return Container();
                  }
                },
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const Divider(),
            DialogListTile(
                icon: 'notification',
                text: 'Notifications',
                onTap: () => Navigator.pushNamed(context, '/notification')),
            DialogListTile(
                icon: 'like_false',
                text: 'Favorites',
                onTap: () {
                  Navigator.pushNamed(context, '/favorites');
                }),
            DialogListTile(
                icon: 'settings',
                text: 'Settings',
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                }),
            DialogListTile(
                icon: 'logout',
                redText: true,
                text: 'Logout',
                onTap: () {
                  Navigator.pop(context);
                  AuthService().signOut(context);
                }),
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
    return ListTile(
        visualDensity: const VisualDensity(vertical: -2.0),
        leading: SvgPicture.asset('assets/icons/$icon.svg', width: 24),
        title: Text(text,
            style: redText ? const TextStyle(color: colors.redWarning) : null),
        onTap: onTap);
  }
}
