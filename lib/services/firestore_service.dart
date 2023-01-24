import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../authentication/services/auth.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addUser(BuildContext context, Map<String, dynamic> json) async {
    try {
      await firestore.collection('users').add(json);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  Future updateUser(
      BuildContext context, String newValue, VoidCallback onSuccess) async {
    try {
      final users = await firestore
          .collection('users')
          .where('uid', isEqualTo: AuthService().getCurrentUserId)
          .limit(1)
          .get();

      final batch = firestore.batch();

      batch.update(users.docs.first.reference, {
        'username': newValue,
      });

      batch.commit();

      onSuccess.call();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  Future addPost(BuildContext context, Map<String, dynamic> json) async {
    try {
      await firestore.collection('posts').add(json);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  Stream<QuerySnapshot> getPosts() {
    return firestore.collection('posts').snapshots();
  }

  Stream<QuerySnapshot> getCurrentUserPosts(String uid) {
    return firestore.collection('posts').where('uid', isEqualTo: uid).snapshots();
  }

  Stream<QuerySnapshot> getUser(String uid) {
    return firestore
        .collection('users')
        .where('uid', isEqualTo: uid)
        .limit(1)
        .snapshots();
  }
}
