import 'package:flutter/material.dart';

class MoodJournalHeader extends StatelessWidget {
  const MoodJournalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFE91E63), Color(0xFF9C27B0)],
          ).createShader(bounds),
          child: const Text(
            'Mood Journal',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Track your emotions, one moment at a time',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
