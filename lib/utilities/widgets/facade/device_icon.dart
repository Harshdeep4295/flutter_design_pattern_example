import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// to change color and indicate which interfaces are interacting based on the value
class DeviceIcon extends StatelessWidget {
  final IconData iconData;
  final bool activated;

  const DeviceIcon({
    @required this.iconData,
    @required this.activated,
  })  : assert(iconData != null),
        assert(activated != null);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: activated ? Colors.green : Colors.red,
      size: 42.0,
    );
  }
}
