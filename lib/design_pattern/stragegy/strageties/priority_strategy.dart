import 'package:flutter_design_pattern_example/design_pattern/stragegy/iShipping_costs_strategy.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/order/order.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
