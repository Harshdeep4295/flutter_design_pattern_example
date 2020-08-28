import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/data_model/design_pattern_category.dart';
import 'package:flutter_design_pattern_example/repository/design_pattern_category_repositories.dart';
import 'package:flutter_design_pattern_example/screens/main_menu/widget/main_menu_card.dart';
import 'package:flutter_design_pattern_example/screens/main_menu/widget/main_menu_header.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';

// Home screen of the app
class MainMenu extends StatelessWidget {
  final DesignPatternCategoriesRepository repository =
      DesignPatternCategoriesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(paddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MainMenuHeader(),
                FutureBuilder<List<DesignPatternCategory>>(
                  future: repository.get(),
                  initialData: [],
                  builder: (
                    _,
                    AsyncSnapshot<List<DesignPatternCategory>> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          for (var category in snapshot.data)
                            Container(
                              margin: const EdgeInsets.only(top: marginL),
                              child: MainMenuCard(
                                category: category,
                              ),
                            )
                        ],
                      );
                    }

                    return CircularProgressIndicator(
                      backgroundColor: lightBackgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.black.withOpacity(0.65),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
