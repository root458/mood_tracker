import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

class MoodTrackerPage extends StatelessWidget {
  const MoodTrackerPage({super.key});

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
                const EmptyTimelineCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
