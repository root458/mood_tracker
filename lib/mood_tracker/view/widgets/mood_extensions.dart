import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

extension MoodUIExtension on Mood {
  Widget get widget {
    switch (this) {
      case Mood.happy:
        return const HappyFace();
      case Mood.neutral:
        return const NeutralFace();
      case Mood.sad:
        return const SadFace();
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
