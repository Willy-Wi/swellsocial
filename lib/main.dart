import 'package:android_development/posts/pages/post_create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// pages
import 'authentication/pages/login_page.dart';
import 'authentication/pages/sign_up_page.dart';
import 'firebase_options.dart';
import 'posts/pages/favorites_page.dart';
import 'posts/pages/home_page.dart';
import 'posts/pages/post_detail_page.dart';
import 'posts/pages/profiles_page.dart';
import 'settings/pages/notification_setting_page.dart';
import 'settings/pages/settings_page.dart';
import 'notification/pages/notifications_page.dart';
import 'authentication/pages/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/sign_up': (BuildContext context) => const SignUpPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/profile': (BuildContext context) => const ProfilesPage(),
        '/post_detail': (BuildContext context) => const PostDetailPage(),
        '/favorites': (BuildContext context) => const FavoritesPage(),
        '/notification': (BuildContext context) => const NotificationsPage(),
        '/settings': (BuildContext context) => const SettingsPage(),
        '/notification_setting': (BuildContext context) =>
            const NotificationSettingPage(),
        '/post_create': (BuildContext context) => const PostCreatePage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else if (snapshot.hasError) {
              return const AuthPage(error: 'Something Went Wrong');
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}
