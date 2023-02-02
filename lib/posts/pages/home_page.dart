import 'package:android_development/authentication/services/auth.dart';
import 'package:android_development/widgets/background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../authentication/models/user_model.dart';
import '../../services/firestore_service.dart';
import '../../services/theme_provider.dart';
import '../models/post_model.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  showNavigationMenu(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation.drive(CurveTween(curve: Curves.decelerate))),
        child: child,
      ),
      pageBuilder: (context, animation, secondAnimation) =>
          const CustomDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Semantics(
                      label: 'Swell Social',
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: colors.greyBoxShadow),
                              child: Image.asset(
                                  'assets/logo/swell_social_logo.png'))),
                    ),
                    Semantics(
                      onTapHint: 'Double Tap To Open Navigation Menu',
                      label: 'Profile',
                      child: CircleAvatar(
                        radius: 30,
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: colors.purpleGreenGradient,
                              shape: BoxShape.circle),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              overlayColor: MaterialStateProperty.all(
                                  colors.purpleSplashRipple),
                              splashColor: colors.purpleSplashRipple,
                              onTap: () => showNavigationMenu(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            //
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0),
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
                    );
                  }),
            ),
            //
            StreamBuilder<QuerySnapshot>(
              stream: FirestoreService().getPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: colors.purple)),
                  );
                } else if (snapshot.hasData) {
                  return Background(
                    child: ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        PostModel posts =
                            PostModel.fromJson(snapshot.data!.docs[index]);

                        return StreamBuilder(
                          stream: FirestoreService().getUser(posts.uid),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              UserModel user =
                                  UserModel.fromJson(snapshot.data!.docs[0]);

                              return PostItem(
                                username: user.username,
                                message: posts.message,
                              );
                            } else if (snapshot.hasError) {
                              return const Text('An unknown error occurred');
                            } else {
                              return Container();
                            }
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('An unknown error occurred'),
                  );
                }
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            splashColor: colors.purpleSplashRipple,
            backgroundColor: themeProvider.isDarkMode ? null : colors.white,
            foregroundColor: colors.purple,
            onPressed: () => Navigator.pushNamed(context, '/post_create'),
            child: Semantics(
                label: 'Create Post Button',
                onTapHint: 'Tap Twice To Create Post',
                child: SvgPicture.asset('assets/icons/add_purple.svg'))),
      ),
    );
  }
}
