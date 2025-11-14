import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../pages/root_shell.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginInput = TextEditingController(); // e-posta veya telefon
  final password = TextEditingController();

  String detectedType = "";
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 80),

              const Text(
                "Giriş Yap",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              // 🔹 TEK INPUT (mail veya telefon)
              _input(
                loginInput,
                "Telefon veya E-posta",
                onChanged: (value) {
                  if (value.contains("@")) {
                    setState(() => detectedType = "email");
                  } else if (RegExp(r'^[0-9+]+$').hasMatch(value)) {
                    setState(() => detectedType = "phone");
                  } else {
                    setState(() => detectedType = "");
                  }
                },
              ),

              const SizedBox(height: 8),

              if (detectedType == "email")
                const Text("Algılanan tip: E-posta",
                    style: TextStyle(color: Colors.white54)),
              if (detectedType == "phone")
                const Text("Algılanan tip: Telefon",
                    style: TextStyle(color: Colors.white54)),

              const SizedBox(height: 20),

              _input(password, "Şifre", isPassword: true),

              const SizedBox(height: 20),

              if (errorText.isNotEmpty)
                Text(
                  errorText,
                  style: const TextStyle(color: Colors.redAccent),
                ),

              const SizedBox(height: 30),

              // 🔵 MODERN GİRİŞ YAP BUTONU
              modernPrimaryButton(
                context,
                "Giriş Yap",
                () {
                  // ----- Validations -----

                  if (loginInput.text.trim().isEmpty) {
                    setState(() => errorText = "E-posta veya telefon gerekli!");
                    return;
                  }

                  if (detectedType == "phone" &&
                      loginInput.text.trim().length < 10) {
                    setState(() => errorText = "Telefon numarası çok kısa!");
                    return;
                  }

                  if (password.text.isEmpty) {
                    setState(() => errorText = "Şifre boş bırakılamaz!");
                    return;
                  }

                  // Her şey doğru → Uygulama ana sayfaya gider
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RootShell()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Input widget (Register ile aynı)
  Widget _input(TextEditingController controller, String label,
      {bool isPassword = false, Function(String)? onChanged}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // 🔵 Çok sade, modern primary button
  Widget modernPrimaryButton(
      BuildContext context, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
