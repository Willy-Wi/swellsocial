import 'package:android_development/widgets/background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import '../../authentication/models/user_model.dart';
import '../../services/firestore_service.dart';
import '../../widgets/back_button.dart';
import '../widgets/post_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Favorites'),
            ),
            Expanded(
              child: Background(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirestoreService().getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            String uid = snapshot.data!.docs[index]['user'];
                            String message =
                                snapshot.data!.docs[index]['message'];
                            return StreamBuilder(
                                stream: FirestoreService().getUser(uid),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    UserModel user = UserModel.fromJson(
                                        snapshot.data!.docs.first);
                                    return PostItem(
                                      username: user.username,
                                      message: message,
                                    );
                                  } else {
                                    return Container();
                                  }
                                });
                          });
                    } else {
                      return const Text('An unknown error occurred');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
