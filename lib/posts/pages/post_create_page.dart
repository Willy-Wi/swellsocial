import 'package:android_development/notif.dart';
import 'package:android_development/posts/models/post_model.dart';
import 'package:android_development/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../authentication/services/auth.dart';
import '../../services/firestore_service.dart';
import '../../services/theme_provider.dart';
import '../../widgets/back_button.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../widgets/post_create.dart';

class PostCreatePage extends StatefulWidget {
  const PostCreatePage({super.key});

  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  TextEditingController messageController = TextEditingController();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.all(25), child: Back(label: 'Create')),
            Expanded(
              child: Background(
                child: PostCreate(messageController: messageController),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: themeProvider.isDarkMode ? null : colors.white,
            splashColor: colors.purpleSplashRipple,
            onPressed: () {
              String message = messageController.text;

              if (message.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fields cannot be empty')));
                return;
              }

              PostModel postModel = PostModel(
                message: message,
                uid: AuthService().getCurrentUserId,
              );

              FirestoreService().addPost(context, postModel.toJson());
              Notif.showNotification(
                  title: 'SwellSocial',
                  body: 'You have successfully created a post',
                  fln: flutterLocalNotificationsPlugin);
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/icons/check.svg')),
      ),
    );
  }
}
