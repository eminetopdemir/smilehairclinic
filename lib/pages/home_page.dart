import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/doctor_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('HairClinic Pro ✨', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700)),
                Row(
                  children: const [
                    Icon(Icons.notifications_none_rounded),
                    SizedBox(width: 12),
                    Icon(Icons.lock_outline_rounded),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 82,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) => _HaloAvatar(name: ['Dr. Eva','Dr. Chen','Dr. Arya','Dr. Ben','Dr. Mia'][i % 5]),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: 8,
              ),
            ),
            const SizedBox(height: 16),
            const DoctorCard(
              name: "Dr. Eva Rostova",
              location: "Los Angeles, CA",
              likes: "1.2k",
              tags: "#FUE #HairRestoration",
              beforeAfter: true,
            ),
            const SizedBox(height: 14),
            const DoctorCard(
              name: "Dr. Marcus Chen",
              location: "New York, NY",
              likes: "986",
              tags: "#DHI #NewLook",
              beforeAfter: true,
            ),
            const SizedBox(height: 14),
            const DoctorCard(
              name: "Dr. Ben Carter",
              location: "Miami, FL",
              likes: "2.5k",
              tags: "#HairlineDesign #Confidence",
              beforeAfter: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _HaloAvatar extends StatefulWidget {
  final String name;
  const _HaloAvatar({required this.name});

  @override
  State<_HaloAvatar> createState() => _HaloAvatarState();
}

class _HaloAvatarState extends State<_HaloAvatar> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
  late final Animation<double> _anim = Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _anim,
          builder: (_, __) => Container(
            width: 56, height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.6*_anim.value), blurRadius: 18, spreadRadius: 1)],
              border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.8), width: 2),
              image: const DecorationImage(image: AssetImage('assets/images/avatar.png'), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(widget.name, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}