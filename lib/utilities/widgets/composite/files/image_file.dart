import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/composite/files/files.dart';

// This is to represet image file extened from the file class itself
class ImageFile extends File {
  ImageFile(String title, int size) : super(title, size, Icons.image);
}
