import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String get getCurrentUserId => auth.currentUser!.uid;

  Future signIn(BuildContext context, String email, String password,
      VoidCallback onSuccess) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      onSuccess.call();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.message}')));
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.message}')));
    }
  }

  Future signUp(BuildContext context, String email, String password,
      VoidCallback onSuccess) async {
    try {
      UserCredential data = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      onSuccess.call();
      return data;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.message}')));
    }
  }

  Future updateDisplayName(
      BuildContext context, String displayName, VoidCallback onSuccess) async {
    try {
      await auth.currentUser!.updateDisplayName(displayName);
      onSuccess.call();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.message}')));
    }
  }
}
