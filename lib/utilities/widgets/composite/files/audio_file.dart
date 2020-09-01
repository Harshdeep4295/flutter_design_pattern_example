import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/composite/files/files.dart';

// This is to represet audio file extened from the file class itself
class AudioFile extends File {
  AudioFile(String title, int size) : super(title, size, Icons.music_note);
}
