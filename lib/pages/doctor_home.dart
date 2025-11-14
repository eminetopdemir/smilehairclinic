import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const Center(
          child: Text("Doktor Paneli",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
