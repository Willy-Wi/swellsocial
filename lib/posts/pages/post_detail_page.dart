import 'dart:developer';

import 'package:android_development/posts/arguments/argument.dart';
import 'package:flutter/material.dart';
import '../../widgets/back_button.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../widgets/post_detail_item.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    inspect(args);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.all(25), child: Back(label: 'Post Detail')),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25)),
                  color: Colors.white,
                  boxShadow: colors.boxShadow,
                ),
                child: PostDetailItem(
                    username: args.username, message: args.message),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
