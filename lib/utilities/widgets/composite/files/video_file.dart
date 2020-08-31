import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/composite/files/files.dart';

// This is to represet video file extened from the file class itself
class VideoFile extends File {
  VideoFile(String title, int size) : super(title, size, Icons.movie);
}
