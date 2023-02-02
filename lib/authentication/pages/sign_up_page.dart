import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../widgets/back_button.dart';
import '../../widgets/button.dart';
import '../models/user_model.dart';
import '../services/auth.dart';
import '../widgets/input_field.dart';
import 'package:android_development/constants/color.dart' as colors;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController confirmPasswordController = TextEditingController(),
      usernameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  Future signUpAndValidate(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;

    FocusManager.instance.primaryFocus?.unfocus();
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your credentials')));
    }
    if (passwordController.text != confirmPasswordController.text) {
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password does not match')));
    }

    try {
      UserCredential data = await AuthService()
          .signUp(context, email, password, () => Navigator.pop(context));

      UserModel user = UserModel(
        email: emailController.text,
        username: usernameController.text,
        uid: data.user!.uid,
      );

      // AuthFirestoreService().addUser(user.toJson(), () {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('An unknown error occurred')));
      // });

      FirestoreService().addUser(context, user.toJson());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(children: [
            //
            const Positioned(
              left: 0,
              top: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Back(),
              ),
            ),
            //
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //
                const Text('Greetings!',
                    style: TextStyle(
                        color: colors.purple,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
                //
                const SizedBox(height: 5),
                //
                const Text('Create your account for the first time'),
                //
                const SizedBox(height: 25),
                //
                Semantics(
                  label: 'Email Field',
                  onTapHint: 'tap to enter your email',
                  child: InputField(
                      controller: emailController,
                      hintText: 'Email',
                      iconPath: 'assets/icons/email.svg'),
                ),
                Semantics(
                  label: 'Display Name Field',
                  onTapHint: 'tap to enter your display name',
                  child: InputField(
                      controller: usernameController,
                      hintText: 'Display Name',
                      iconPath: 'assets/icons/profile.svg'),
                ),
                Semantics(
                  label: 'Password field',
                  onTapHint: 'tap to enter your password',
                  child: InputField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: 'Password',
                      iconPath: 'assets/icons/lock.svg'),
                ),
                Semantics(
                  label: 'Confirm Password field',
                  onTapHint: 'tap to enter your confirm password',
                  child: InputField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      iconPath: 'assets/icons/lock.svg'),
                ),
                //
                //
                //
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(foregroundColor: colors.purple),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                      child: Semantics(
                        label: 'already have an account?',
                        onTapHint: 'tap to login',
                        child: const Text(
                          'Already have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                //
                Semantics(
                  label: 'Sign up button',
                  onTapHint: 'tap to sign up',
                  child: Button(
                    label: 'Sign Up',
                    useAccentColor: true,
                    onTap: () {
                      signUpAndValidate(context);
                    },
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
