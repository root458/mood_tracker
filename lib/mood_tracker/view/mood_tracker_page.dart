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
                        onTap: () => LogMoodDialog.show(
                          context,
                          initialMood: mood,
                        ),
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
                        return Column(
                          children: [
                            MoodTimeline(entries: entries),
                            const SizedBox(height: 16),
                            TextButton.icon(
                              onPressed: () async {
                                final confirm = await ConfirmationDialog.show(
                                  context,
                                  title: 'Clear All Entries?',
                                  content:
                                      'Are you sure you want to delete '
                                      'all entries? This action cannot be '
                                      'undone.',
                                );

                                if (confirm && context.mounted) {
                                  unawaited(
                                    context.read<MoodTrackerCubit>().clearAll(),
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.delete_sweep,
                                color: Colors.red,
                              ),
                              label: const Text(
                                'Clear All',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
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
