import 'package:flutter/material.dart';

class ProgressTimeline extends StatelessWidget {
  const ProgressTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      _StepTile(title: 'Procedure Day', date: 'October 1st', icon: Icons.local_hospital_rounded),
      _StepTile(title: 'Day 1: Post-Op', date: 'View Photos', icon: Icons.photo_library_outlined),
      _StepTile(title: 'Week 2', date: 'October 15th', icon: Icons.event_rounded),
      _StepTile(title: 'Month 3', date: 'January 1st', icon: Icons.timeline_rounded),
      _StepTile(title: 'New Growth', date: 'View Photos', icon: Icons.grass_rounded),
    ];
    return Column(children: items);
  }
}

class _StepTile extends StatelessWidget {
  final String title;
  final String date;
  final IconData icon;
  const _StepTile({required this.title, required this.date, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B2537),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(date, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ])),
          TextButton(onPressed: (){}, child: const Text('View')),
        ],
      ),
    );
  }
}