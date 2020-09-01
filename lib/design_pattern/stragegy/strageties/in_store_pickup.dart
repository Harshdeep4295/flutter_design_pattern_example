import 'package:flutter_design_pattern_example/design_pattern/stragegy/iShipping_costs_strategy.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/order/order.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-store pickup';

  @override
  double calculate(Order order) {
    return 0.0;
  }
}
