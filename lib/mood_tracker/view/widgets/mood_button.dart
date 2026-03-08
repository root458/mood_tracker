import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker/data/data.dart';
import 'package:mood_tracker/mood_tracker/view/widgets/mood_extensions.dart';

class MoodButton extends StatelessWidget {
  const MoodButton({
    required this.mood,
    required this.onTap,
    this.isSelected = false,
    this.showLabel = false,
    super.key,
  });

  final Mood mood;
  final VoidCallback onTap;
  final bool isSelected;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: mood.color,
              borderRadius: BorderRadius.circular(16),
              border: isSelected
                  ? Border.all(color: const Color(0xFFB388FF), width: 4)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: mood.color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                mood.emoji,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          if (showLabel) ...[
            const SizedBox(height: 8),
            Text(
              mood.label,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
