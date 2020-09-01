import 'package:flutter_design_pattern_example/design_pattern/stragegy/order/order.dart';

abstract class IShippingCostsStrategy {
  String label;
  double calculate(Order order);
}
