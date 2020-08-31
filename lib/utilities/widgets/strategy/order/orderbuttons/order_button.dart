import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/platform_button.dart';

class OrderButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  const OrderButton({
    @required this.iconData,
    @required this.title,
    @required this.onPressed,
  })  : assert(iconData != null),
        assert(title != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return PlatformButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          const SizedBox(width: spaceXS),
          Text(title),
        ],
      ),
      materialColor: Colors.black,
      materialTextColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
