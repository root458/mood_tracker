import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker/data/data.dart';

extension MoodUIExtension on Mood {
  String get emoji {
    switch (this) {
      case Mood.happy:
        return '😊';
      case Mood.neutral:
        return '😐';
      case Mood.sad:
        return '😔';
    }
  }

  Color get color {
    switch (this) {
      case Mood.happy:
        return const Color(0xFF2EFE8C);
      case Mood.neutral:
        return const Color(0xFF29B6F6);
      case Mood.sad:
        return const Color(0xFFAB47BC);
    }
  }

  String get label {
    switch (this) {
      case Mood.happy:
        return 'Happy';
      case Mood.neutral:
        return 'Neutral';
      case Mood.sad:
        return 'Sad';
    }
  }
}
