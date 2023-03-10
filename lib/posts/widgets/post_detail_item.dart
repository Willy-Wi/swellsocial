import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

import 'action_chip_button.dart';

class PostDetailItem extends StatefulWidget {
  const PostDetailItem(
      {super.key, this.username = 'Unknown', this.message = 'Unknown'});

  final String username, message;

  @override
  State<PostDetailItem> createState() => _PostDetailItemState();
}

class _PostDetailItemState extends State<PostDetailItem> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(children: [
        // User Profile
        ListTile(
          textColor: colors.dark,
          contentPadding: EdgeInsets.zero,
          leading: GestureDetector(
            // ignore this onTap
            onTap: () {},
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: colors.purpleGreenGradient,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          title: Row(children: [
            GestureDetector(
              // ignore this onTap
              onTap: () {},
              child: Text(
                widget.username,
                style: textTheme.titleMedium,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ]),
          subtitle: Text('12 min ago', style: textTheme.labelLarge),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            ActionChipButton(icon: 'like_false', onPressed: () {}, label: '40'),
            const SizedBox(width: 10),
            ActionChipButton(icon: 'comments', onPressed: () {}, label: '40'),
          ]),
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.message, style: textTheme.titleMedium),
        ),
        const SizedBox(height: 15),
        // Image
        // AspectRatio(
        //   aspectRatio: 4 / 3,
        //   child: Container(
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       gradient: colors.purpleGreenGradient,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
