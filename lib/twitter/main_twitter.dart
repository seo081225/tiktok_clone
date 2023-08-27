import 'package:flutter/material.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/twitter/create_account_screen.dart';
import 'package:tiktok_clone_2023/twitter/initial_screen.dart';
import 'package:tiktok_clone_2023/twitter/interests_screen.dart';
import 'package:tiktok_clone_2023/twitter/password_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0xFF4d9ae7),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600),
          )),
      home: const SignUpScreen(),
    );
  }
}
