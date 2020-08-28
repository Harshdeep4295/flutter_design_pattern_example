import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: paddingXL,
      ),
      child: Center(
        child: Text(
          'Coming Soon!',
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white70,
              ),
        ),
      ),
    );
  }
}
