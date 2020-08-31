import 'package:flutter/widgets.dart';

// interface class to show same methods for directory and file to render and get size.
abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
}
