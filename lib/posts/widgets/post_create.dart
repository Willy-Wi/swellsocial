import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../../authentication/models/user_model.dart';
import '../../authentication/services/auth.dart';
import '../../services/firestore_service.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({super.key, required this.messageController});

  final TextEditingController messageController;

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: colors.dark);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(colors.purpleSplashRipple),
        splashColor: colors.purpleSplashRipple,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: <Widget>[
              // User Profile
              ListTile(
                textColor: colors.dark,
                contentPadding: EdgeInsets.zero,
                leading: InkWell(
                  overlayColor:
                      MaterialStateProperty.all(colors.purpleSplashRipple),
                  splashColor: colors.purpleSplashRipple,
                  customBorder: const CircleBorder(),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
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
                  InkWell(
                    overlayColor:
                        MaterialStateProperty.all(colors.purpleSplashRipple),
                    splashColor: colors.purpleSplashRipple,
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirestoreService()
                          .getUser(AuthService().getCurrentUserId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          UserModel user =
                              UserModel.fromJson(snapshot.data!.docs[0]);
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
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ]),
                subtitle: const Text('12 min ago',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
              ),

              TextField(
                controller: widget.messageController,
                cursorColor: colors.purple,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyle(
                      color: colors.dark,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              // AspectRatio(
              //   aspectRatio: 4 / 3,
              //   child: Container(
              //       decoration: BoxDecoration(
              //         gradient: colors.purpleGreenGradient,
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       width: double.infinity),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
