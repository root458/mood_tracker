import 'package:flutter/material.dart';

class EmptyTimelineCard extends StatelessWidget {
  const EmptyTimelineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.widthOf(context) * .8,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        children: [
          Text(
            '✨',
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 16),
          Text(
            'No entries yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
