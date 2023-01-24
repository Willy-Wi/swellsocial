import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../../widgets/follow_button.dart';

class UserItem extends StatefulWidget {
  const UserItem({super.key});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: colors.dark);

    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 25,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: colors.purpleGreenGradient,
          ),
        ),
      ),
      title: Text(
        'Username',
        style: textStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '@usernametag',
        style: textStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const FollowButton(),
    );
  }
}
