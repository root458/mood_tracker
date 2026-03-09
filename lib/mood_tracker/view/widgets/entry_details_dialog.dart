import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

class EntryDetailsDialog extends StatefulWidget {
  const EntryDetailsDialog({
    required this.entry,
    super.key,
  });

  final MoodEntry entry;

  static Future<void> show(BuildContext context, {required MoodEntry entry}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: EntryDetailsDialog(entry: entry),
      ),
    );
  }

  @override
  State<EntryDetailsDialog> createState() => _EntryDetailsDialogState();
}

class _EntryDetailsDialogState extends State<EntryDetailsDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    final isHappy = widget.entry.mood == Mood.happy;
    final isSad = widget.entry.mood == Mood.sad;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: isHappy
            ? 600
            : isSad
            ? 1200
            : 800,
      ),
    );

    if (isHappy) {
      // Bouncy animation
      _animation = TweenSequence<double>([
        TweenSequenceItem(tween: Tween(begin: 1, end: 1.2), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.9), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.1), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 1.1, end: 1), weight: 1),
      ]).animate(_controller);
    } else if (isSad) {
      // Slow sad sway
      _controller.duration = const Duration(milliseconds: 2000);
      _animation = TweenSequence<double>([
        TweenSequenceItem(tween: Tween(begin: 0, end: -0.1), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -0.1, end: 0.1), weight: 2),
        TweenSequenceItem(tween: Tween(begin: 0.1, end: 0), weight: 1),
      ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    } else {
      _animation = TweenSequence<double>([
        TweenSequenceItem(tween: Tween(begin: 0, end: 5), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 5, end: -5), weight: 2),
        TweenSequenceItem(tween: Tween(begin: -5, end: 5), weight: 2),
        TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 1),
      ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    }

    unawaited(_controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 380),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final mood = widget.entry.mood;
                    if (mood == Mood.happy) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: child,
                      );
                    } else if (mood == Mood.sad) {
                      return Transform.rotate(
                        angle: _animation.value * math.pi,
                        child: child,
                      );
                    } else {
                      return Transform.translate(
                        offset: Offset(_animation.value, 0),
                        child: child,
                      );
                    }
                  },
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: widget.entry.mood.widget,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.entry.date.timeAgo(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (widget.entry.note.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.entry.note,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final confirm = await ConfirmationDialog.show(
                    context,
                    title: 'Delete Entry?',
                    content:
                        'Are you sure you want to delete this mood '
                        'entry? This action cannot be undone.',
                  );

                  if (confirm && context.mounted) {
                    unawaited(
                      context.read<MoodTrackerCubit>().removeMoodEntry(
                        widget.entry,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.delete_outline),
                label: const Text(
                  'Delete Entry',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
