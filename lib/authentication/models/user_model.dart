import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({required this.uid, required this.email, required this.username});

  final String email, username, uid;

  UserModel.fromJson(DocumentSnapshot json)
      : email = json['email'],
        username = json['username'],
        uid = json['uid'];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'uid': uid,
    };
  }
}
