import 'package:android_development/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, this.error});

  final String? error;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: colors.greyBoxShadow,
              ),
              child: Image.asset('assets/logo/swell_social_logo_big.png',
                  width: 300),
            ),
            //
            const SizedBox(height: 30),
            //
            const Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colors.purple),
            ),
            //
            const SizedBox(height: 5),
            //
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.0),
              child: Text(
                  'Explore all the wonderful things people all around the world',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12)),
            ),
            //
            const SizedBox(height: 30),
            //
            Button(
              label: 'Login',
              useAccentColor: true,
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
            //
            const SizedBox(height: 15),
            //
            Button(
              label: 'Sign Up',
              onTap: () => Navigator.pushNamed(context, '/sign_up'),
            ),
          ],
        ),
      ),
    );
  }
}
