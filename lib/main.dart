import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/root_shell.dart';
import 'auth/welcome_page.dart';

void main() {
  runApp(const SmileHairClinicApp());
}

class SmileHairClinicApp extends StatelessWidget {
  const SmileHairClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmileHairClinic',
      theme: AppTheme.darkTheme,
      home: const WelcomePage(),
    );
  }
}
