import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CapturePage extends StatelessWidget {
  const CapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.close_rounded),
                Spacer(),
                Text('Step 1/5', style: TextStyle(fontWeight: FontWeight.w600)),
                Spacer(),
                Icon(Icons.help_outline_rounded),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 260, height: 260,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0C3A47),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 20)],
                      ),
                    ),
                    Container(
                      width: 180, height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 3),
                      ),
                    ),
                    const Positioned(bottom: 24, child: Text('Front View\nAlign your face with the silhouette.', textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _RoundButton(icon: Icons.camera_alt_rounded, label: "Capture", onTap: () {}),
                _RoundButton(icon: Icons.autorenew_rounded, label: "Retry", onTap: () {}),
                _RoundButton(icon: Icons.flash_on_rounded, label: "Flash", onTap: () {}),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _RoundButton({required this.icon, required this.label, required this.onTap});

  @override
  State<_RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<_RoundButton> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat(reverse: true);
  late final Animation<double> _scale = Tween(begin: 1.0, end: 1.06).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: _scale,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 64, height: 64,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.card),
              child: Icon(widget.icon, color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(widget.label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}