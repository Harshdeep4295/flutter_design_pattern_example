import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_design_pattern_example/data_model/design_pattern_category.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';

// This class is used to get list of patterns define in the assets/data/design pattern
// this will be use to define data for the main menu section
class DesignPatternCategoriesRepository {
  Future<List<DesignPatternCategory>> get() async {
    var menuJson = await rootBundle.loadString(designPatternsJsonPath);
    var designPatternCategoryJsonList = json.decode(menuJson) as List;
    var mainMenuSections = designPatternCategoryJsonList
        .map((categoryJson) => DesignPatternCategory.fromJson(categoryJson))
        .toList();

    return mainMenuSections;
  }
}
