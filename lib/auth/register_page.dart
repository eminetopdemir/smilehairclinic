import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 70),

                const Text(
                  "Kayıt Ol",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                _input(name, "İsim Soyisim"),
                const SizedBox(height: 12),

                _input(email, "E-posta"),
                const SizedBox(height: 12),

                _input(phone, "Telefon Numarası"),
                const SizedBox(height: 12),

                _input(password, "Şifre", isPassword: true),
                const SizedBox(height: 12),

                _input(confirmPassword, "Şifre Tekrar", isPassword: true),
                const SizedBox(height: 16),

                if (errorText.isNotEmpty)
                  Text(
                    errorText,
                    style: const TextStyle(color: Colors.redAccent),
                  ),

                const SizedBox(height: 25),

                // 🔵 Modern Kayıt Ol Butonu
                modernPrimaryButton(
                  context,
                  "Kayıt Ol",
                  () {
                    // Validation başlıyor ❤️

                    if (name.text.trim().isEmpty) {
                      setState(
                          () => errorText = "İsim Soyisim boş bırakılamaz!");
                      return;
                    }

                    if (email.text.trim().isEmpty) {
                      setState(() => errorText = "E-posta adresi gerekli!");
                      return;
                    }

                    if (phone.text.trim().length < 10) {
                      setState(() => errorText = "Telefon numarası geçersiz!");
                      return;
                    }

                    if (password.text.isEmpty || confirmPassword.text.isEmpty) {
                      setState(
                          () => errorText = "Şifre alanları boş bırakılamaz!");
                      return;
                    }

                    if (password.text != confirmPassword.text) {
                      setState(() => errorText = "Şifreler aynı değil!");
                      return;
                    }

                    // Hepsi doğru → Login'e yönlendiriyoruz
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: label == "Telefon Numarası"
            ? TextInputType.phone
            : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // 🔵 Çok sade, minimal bir primary button (Apple style)
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
