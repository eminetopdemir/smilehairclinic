import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/progress_timeline.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Hello, Alex', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              Icon(Icons.person_outline_rounded),
            ],
          ),
          const SizedBox(height: 16),
          _AppointmentCard(),
          const SizedBox(height: 16),
          Text('Daily Regimen', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          _RegimenItem(title: "Finasteride", subtitle: "1mg, Morning"),
          const SizedBox(height: 8),
          _RegimenItem(title: "Minoxidil Foam", subtitle: "5% Solution, Morning & Night"),
          const SizedBox(height: 20),
          Text('Your Journey', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const ProgressTimeline(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B2537),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Next Appointment', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: Text('6-Month Follow-Up\nMon, Oct 28 at 2:30 PM\nHairClinic Pro, Downtown Branch')),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary, foregroundColor: Colors.black, shape: StadiumBorder()),
                child: const Text('Add to Cal.'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RegimenItem extends StatefulWidget {
  final String title;
  final String subtitle;
  const _RegimenItem({required this.title, required this.subtitle});

  @override
  State<_RegimenItem> createState() => _RegimenItemState();
}

class _RegimenItemState extends State<_RegimenItem> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B2537),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(widget.subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ])),
          Switch(value: checked, onChanged: (v)=> setState(()=> checked=v), activeColor: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}