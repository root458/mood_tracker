import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

class MoodButton extends StatelessWidget {
  const MoodButton({
    required this.mood,
    required this.onTap,
    this.isSelected = false,
    this.showLabel = false,
    this.reserveLabelSpace = false,
    super.key,
  });

  final Mood mood;
  final VoidCallback onTap;
  final bool isSelected;
  final bool showLabel;
  final bool reserveLabelSpace;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
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
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: mood.widget,
                ),
              ),
            ),
            if (showLabel || reserveLabelSpace) ...[
              const SizedBox(height: 8),
              Opacity(
                opacity: showLabel ? 1.0 : 0.0,
                child: Text(
                  mood.label,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
