import 'package:android_development/follow/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../../widgets/back_button.dart';

class FollowsPage extends StatefulWidget {
  const FollowsPage({super.key, required this.appBarTitle});

  final String appBarTitle;

  @override
  State<FollowsPage> createState() => _FollowsPageState();
}

class _FollowsPageState extends State<FollowsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            //
            Padding(
              padding: const EdgeInsets.all(25),
              child: Back(label: widget.appBarTitle),
            ),
            //
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25)),
                    boxShadow: colors.purpleBoxShadow),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 20.0),
                  child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return const UserItem();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
