import 'package:android_development/authentication/widgets/input_field.dart';
import 'package:android_development/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

import '../../widgets/back_button.dart';
import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    FocusManager.instance.primaryFocus?.unfocus();

    if (email.isEmpty || password.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your credentials')));
    }

    AuthService()
        .signIn(context, email, password, () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Stack(children: [
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
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: colors.purple,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                //
                const SizedBox(height: 5),
                //
                const Text('Continue from where you left off'),
                //
                const SizedBox(height: 25),
                //
                InputField(
                    controller: emailController,
                    hintText: 'Email',
                    iconPath: 'assets/icons/email.svg'),
                //
                InputField(
                    obscureText: true,
                    controller: passwordController,
                    hintText: 'Password',
                    iconPath: 'assets/icons/lock.svg'),
                //
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign_up');
                    },
                    style: TextButton.styleFrom(foregroundColor: colors.purple),
                    child: const Text('Don\'t have an account?',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                //
                Button(
                    label: 'Login',
                    useAccentColor: true,
                    onTap: () => login(context)),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
