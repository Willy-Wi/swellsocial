import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  const PostModel({required this.uid, required this.message});

  final String message, uid;

  PostModel.fromJson(DocumentSnapshot json)
      : message = json['message'],
        uid = json['uid'];

  Map<String, dynamic> toJson() {
    return {'message': message, 'uid': uid};
  }
}
