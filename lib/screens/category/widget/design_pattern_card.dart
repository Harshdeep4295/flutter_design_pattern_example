import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/data_model/design_pattern_model.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/selction_card.dart';

// this widget is used to show design pattern card in list...
class DesignPatternCard extends StatelessWidget {
  final DesignPattern designPattern;

  const DesignPatternCard({
    @required this.designPattern,
  }) : assert(designPattern != null);

  @override
  Widget build(BuildContext context) {
    var contentHeader = Text(
      designPattern.title,
      style: Theme.of(context).textTheme.title.copyWith(
            fontSize: 26.0,
          ),
      overflow: TextOverflow.ellipsis,
    );
    var contentText = Text(
      designPattern.description,
      style: Theme.of(context).textTheme.body1,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
    var onSelectionCardTap = () => Navigator.pushNamed(
          context,
          designPattern.route,
          arguments: designPattern,
        );

    return SelectionCard(
      backgroundColor: lightBackgroundColor,
      backgroundHeroTag: "${designPattern.id}_background",
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
