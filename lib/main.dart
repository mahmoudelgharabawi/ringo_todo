import 'package:flutter/material.dart';
import 'package:ringo_todo/module/auth/login.page.dart';
import 'package:ringo_todo/utils/app.colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ring Todo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.mainColor,
          selectionColor: AppColors.mainColor,
          selectionHandleColor: AppColors.mainColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
