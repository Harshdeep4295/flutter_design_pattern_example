import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/composite/files/files.dart';

// This is to represet text file extened from the file class itself
class TextFile extends File {
  TextFile(String title, int size) : super(title, size, Icons.description);
}
