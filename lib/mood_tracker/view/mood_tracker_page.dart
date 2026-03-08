import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  @override
  void initState() {
    super.initState();

    unawaited(context.read<MoodTrackerCubit>().init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF0F5),
              Colors.white,
              Color(0xFFF0F8FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 48),
                const MoodJournalHeader(),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: Mood.values.map((mood) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: MoodButton(
                        mood: mood,
                        onTap: () => LogMoodDialog.show(context),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Tap a mood above to journal',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 48),
                BlocBuilder<MoodTrackerCubit, MoodTrackerState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (entries) {
                        if (entries.isEmpty) {
                          return const EmptyTimelineCard();
                        }
                        return _MoodTimeline(entries: entries);
                      },
                      orElse: () => const CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MoodTimeline extends StatelessWidget {
  const _MoodTimeline({required this.entries});

  final List<MoodEntry> entries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final entry = entries[index];
          return _TimelineItem(
            date: entry.date,
            mood: entry.mood,
          );
        },
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.date,
    required this.mood,
  });

  final DateTime date;
  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${date.day}/${date.month}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: mood.color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Text(
            mood.emoji,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ],
    );
  }
}
