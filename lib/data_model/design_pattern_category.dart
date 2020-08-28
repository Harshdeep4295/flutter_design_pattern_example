import 'package:flutter_design_pattern_example/data_model/design_pattern_model.dart';

// This class is the basic model for the design pattern category mapped with UI
class DesignPatternCategory {
  final String id;
  final String title;
  final int color;
  final List<DesignPattern> patterns;

  DesignPatternCategory({
    this.id,
    this.title,
    this.color,
    this.patterns,
  });

  factory DesignPatternCategory.fromJson(Map<String, dynamic> json) {
    var designPatternJsonList = json['patterns'] as List;
    var designPatternList = designPatternJsonList
        .map((designPatternJson) => DesignPattern.fromJson(designPatternJson))
        .toList();

    return DesignPatternCategory(
      id: json['id'],
      title: json['title'],
      color: int.parse(json['color']),
      patterns: designPatternList,
    );
  }
}
