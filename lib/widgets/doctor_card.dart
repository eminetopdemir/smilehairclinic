import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String location;
  final String likes;
  final String tags;
  final bool beforeAfter;
  const DoctorCard({super.key, required this.name, required this.location, required this.likes, required this.tags, this.beforeAfter=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B2537),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (beforeAfter)
            Row(
              children: [
                _pill(context, 'BEFORE'),
                const SizedBox(width: 6),
                _pill(context, 'AFTER'),
              ],
            ),
          const SizedBox(height: 8),
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: const Color(0xFF123345),
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(image: AssetImage('assets/images/hair.png'), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
          Text(location, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: Text(tags, style: const TextStyle(color: Colors.white70, fontSize: 12))),
              Row(children: [
                const Icon(Icons.favorite_border_rounded, size: 18),
                const SizedBox(width: 4),
                Text(likes),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pill(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11)),
    );
  }
}