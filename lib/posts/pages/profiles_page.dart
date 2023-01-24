import 'package:android_development/authentication/services/auth.dart';
import 'package:android_development/follow/pages/follows_page.dart';
import 'package:android_development/posts/widgets/post_item.dart';
import 'package:android_development/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import '../../authentication/models/user_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/follow_button.dart';
import '../models/post_model.dart';
import '../widgets/chip.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: colors.dark);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Profile'),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirestoreService()
                      .getUser(AuthService().getCurrentUserId),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      UserModel user =
                          UserModel.fromJson(snapshot.data!.docs[0]);
                      return DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(25)),
                            boxShadow: colors.boxShadow),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 25, right: 25),
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      radius: 30,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: colors.purpleGreenGradient,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      user.username,
                                      style: textStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '@${user.username}',
                                      style: textStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    trailing: const FollowButton(),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomChip(
                                        count: '4',
                                        label: 'Posts',
                                        onTap: () {},
                                      ),
                                      CustomChip(
                                        count: '120',
                                        label: 'Followers',
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FollowsPage(
                                                    appBarTitle: 'Followers'),
                                          ),
                                        ),
                                      ),
                                      CustomChip(
                                        count: '150',
                                        label: 'Following',
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FollowsPage(
                                                    appBarTitle: 'Following'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //
                                  const SizedBox(height: 20),
                                  //
                                  const Divider(),
                                  //
                                  const SizedBox(height: 20),
                                  //
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Posts',
                                          style: TextStyle(
                                              color: colors.dark,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(height: 2),
                                        Container(
                                          height: 3,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: colors.purple),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //
                            Expanded(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirestoreService().getCurrentUserPosts(
                                    AuthService().getCurrentUserId),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasData) {
                                    return ListView.separated(
                                      itemCount: snapshot.data.docs.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider();
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        PostModel posts = PostModel.fromJson(
                                            snapshot.data.docs[index]);
                                        return PostItem(
                                          username: user.username,
                                          message: posts.message,
                                        );
                                      },
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                            //
                            // Expanded(
                            //   child: GridView.builder(
                            //       itemCount: 10,
                            //       gridDelegate:
                            //           const SliverGridDelegateWithFixedCrossAxisCount(
                            //         mainAxisSpacing: 25,
                            //         crossAxisSpacing: 25,
                            //         crossAxisCount: 2,
                            //         childAspectRatio: 1.25,
                            //       ),
                            //       itemBuilder: (context, index) {
                            //         return Container(
                            //           decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(10),
                            //               gradient: colors.purpleGreenGradient),
                            //           child: Material(
                            //             color: Colors.transparent,
                            //             child: InkWell(
                            //               splashColor: colors.purpleSplashRipple,
                            //               overlayColor: MaterialStateProperty.all(
                            //                 colors.purpleSplashRipple,
                            //               ),
                            //               customBorder: RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(10)),
                            //               onTap: () {
                            //                 Navigator.pushNamed(
                            //                     context, '/post_detail');
                            //               },
                            //             ),
                            //           ),
                            //         );
                            //       }),
                            // )
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
