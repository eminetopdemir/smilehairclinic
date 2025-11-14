import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/message_bubble.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16,16,16,8),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                SizedBox(width: 6),
                Text('Recovery Assistant', style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                MessageBubble(text: "Welcome to your personalized recovery journey! I'm here to guide you every step of the way.", isMe: false),
                MessageBubble(text: "Tip of the day: Gently spray the transplanted area with saline solution every 2 hours to keep it moist.", isMe: false),
                MessageBubble(text: "Congratulations on completing your first week! The initial redness should start to subside.", isMe: false),
                MessageBubble(text: "Your first wash is a big milestone. Remember to be very gentle.", isMe: false),
                MessageBubble(text: "Thanks! Show me how.", isMe: true),
              ],
            ),
          ),
          const _InputBar(),
        ],
      ),
    );
  }
}

class _InputBar extends StatefulWidget {
  const _InputBar();

  @override
  State<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<_InputBar> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B2537),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(border: InputBorder.none, hintText: 'Ask the assistant...'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
                boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.7), blurRadius: 16, spreadRadius: 2)],
              ),
              child: IconButton(
                onPressed: () { controller.clear(); },
                icon: const Icon(Icons.send_rounded, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}