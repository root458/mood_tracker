import 'dart:async';

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
                      child: TimelineItem(entry: entry),
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
    required this.entry,
    super.key,
  });

  final MoodEntry entry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => EntryDetailsDialog.show(context, entry: entry),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: TimeAgoText(
                date: entry.date,
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
              color: entry.mood.color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 32,
              height: 32,
              child: entry.mood.widget,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeAgoText extends StatefulWidget {
  const TimeAgoText({
    required this.date,
    this.style,
    super.key,
  });

  final DateTime date;
  final TextStyle? style;

  @override
  State<TimeAgoText> createState() => _TimeAgoTextState();
}

class _TimeAgoTextState extends State<TimeAgoText> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _scheduleNextUpdate();
  }

  @override
  void didUpdateWidget(TimeAgoText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.date != oldWidget.date) {
      _scheduleNextUpdate();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _scheduleNextUpdate() {
    _timer?.cancel();

    final now = DateTime.now();
    final difference = now.difference(widget.date);

    Duration delay;
    if (difference.inHours >= 1) {
      final minutesToNextHour = 60 - (difference.inMinutes % 60);
      delay = Duration(minutes: minutesToNextHour, seconds: 1);
    } else {
      final secondsToNextMinute = 60 - (difference.inSeconds % 60);
      delay = Duration(seconds: secondsToNextMinute, milliseconds: 100);
    }

    _timer = Timer(delay, () {
      if (mounted) {
        setState(() {});
        _scheduleNextUpdate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.date.timeAgo(),
      style: widget.style,
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
