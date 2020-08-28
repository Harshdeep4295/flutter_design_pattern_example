import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/data_model/design_pattern_category.dart';
import 'package:flutter_design_pattern_example/data_model/design_pattern_model.dart';
import 'package:flutter_design_pattern_example/navigation_class/design_pattern_route.dart';
import 'package:flutter_design_pattern_example/screens/category/category.dart';
import 'package:flutter_design_pattern_example/screens/design_pattern_details/design_pattern_details.dart';
import 'package:flutter_design_pattern_example/screens/main_menu/main_menu.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/introduction/introduction.dart';

// The class where all the routes are define for the app
class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => MainMenu(),
        );
      case categoryRoute:
        var category = routeSettings.arguments as DesignPatternCategory;
        return MaterialPageRoute(
          builder: (_) => Category(
            category: category,
          ),
        );
      case DesignPatternRoutes.introductionRoute:
        var designPattern = routeSettings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: designPattern,
            example: Introduction(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => MainMenu(),
        );
    }
  }
}
