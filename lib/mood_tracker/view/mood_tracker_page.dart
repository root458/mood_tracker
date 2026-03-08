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
              Color(0xFFFFF0F5), // Light pinkish
              Colors.white,
              Color(0xFFF0F8FF), // Alice blue
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: Mood.values.map((mood) {
                    return MoodButton(
                      mood: mood,
                      onTap: () => LogMoodBottomSheet.show(context),
                    );
                  }).toList(),
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
