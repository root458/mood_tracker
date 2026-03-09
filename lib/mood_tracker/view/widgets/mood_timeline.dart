import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

class MoodTimeline extends StatelessWidget {
  const MoodTimeline({required this.entries, super.key});

  final List<MoodEntry> entries;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * 0.8;
        final itemWidth = width / 7;

        return Center(
          child: SizedBox(
            height: 120,
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: entries.map((entry) {
                    return SizedBox(
                      width: itemWidth,
                      child: TimelineItem(
                        date: entry.date,
                        mood: entry.mood,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    required this.date,
    required this.mood,
    super.key,
  });

  final DateTime date;
  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              date.timeAgo(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: mood.color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            mood.emoji,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

extension DateTimeAgoExtension on DateTime {
  String timeAgo() {
    final difference = DateTime.now().difference(this);
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}y ago';
    } else if (difference.inDays >= 30) {
      return '${(difference.inDays / 30).floor()}mo ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
