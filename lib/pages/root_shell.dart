import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_page.dart';
import 'capture_page.dart';
import 'shop_page.dart';
import 'profile_page.dart';
import 'chatbot_page.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> with TickerProviderStateMixin {
  int _index = 0;
  late final AnimationController _glowCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  late final Animation<double> _glow = Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _glowCtrl, curve: Curves.easeInOut));

  final pages = const [
    HomePage(),
    CapturePage(),
    ShopPage(),
    ProfilePage(),
    ChatbotPage(),
  ];

  @override
  void dispose() {
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: IndexedStack(index: _index, children: pages),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (i) => setState(() => _index = i),
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
                const BottomNavigationBarItem(icon: Icon(Icons.camera_alt_rounded), label: "Capture"),
                const BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: "Shop"),
                const BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
                BottomNavigationBarItem(
                  icon: FadeTransition(
                    opacity: _glow,
                    child: const Icon(Icons.chat_bubble_rounded),
                  ),
                  label: "Chatbot",
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _index == 0
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.6), blurRadius: 18, spreadRadius: 2),
                  ],
                ),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => setState(() => _index = 1),
                  child: const Icon(Icons.camera_alt),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}