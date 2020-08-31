import 'package:flutter/services.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';

// This class hols the details of the markdown repository and get data to display on screen
class MarkdownRepository {
  Future<String> get(String designPatternId) async {
    var path = '$markdownPath$designPatternId.md';
    var markdownString = await rootBundle.loadString(path);

    return markdownString;
  }
}
