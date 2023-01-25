import 'package:android_development/posts/pages/post_create_page.dart';
import 'package:android_development/services/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) =>
          ThemeProvider(darkMode: prefs.getBool('darkMode')),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

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
        // scaffoldBackgroundColor: colors.white,
        textTheme: GoogleFonts.quicksandTextTheme(
          const TextTheme(
            titleMedium: TextStyle(
                color: colors.dark, fontWeight: FontWeight.w600, fontSize: 15),
            labelLarge: TextStyle(
                color: colors.dark, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(
          const TextTheme(
            titleMedium: TextStyle(
                color: colors.white, fontWeight: FontWeight.w600, fontSize: 15),
            labelLarge: TextStyle(
                color: colors.white, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
        brightness: Brightness.dark,
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
