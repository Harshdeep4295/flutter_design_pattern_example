import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/iShipping_costs_strategy.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/order/order.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/order/order_item.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/strageties/in_store_pickup.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/strageties/parcel_terminal_strategy.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/strageties/priority_strategy.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/strategy/order/order_item_table.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/strategy/order/order_summary/order_summary.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/strategy/order/orderbuttons/order_buttons.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/strategy/shipping_order.dart';

class StrategyExample extends StatefulWidget {
  @override
  _StrategyExampleState createState() => _StrategyExampleState();
}

class _StrategyExampleState extends State<StrategyExample> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];
  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int index) {
    setState(() {
      _selectedStrategyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OrderButtons(
              onAdd: _addToOrder,
              onClear: _clearOrder,
            ),
            const SizedBox(height: spaceM),
            Stack(
              children: <Widget>[
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _order.items.isEmpty ? 1.0 : 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Your order is empty',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _order.items.isEmpty ? 0.0 : 1.0,
                  child: Column(
                    children: <Widget>[
                      OrderItemsTable(
                        orderItems: _order.items,
                      ),
                      const SizedBox(height: spaceM),
                      ShippingOptions(
                        selectedIndex: _selectedStrategyIndex,
                        shippingOptions: _shippingCostsStrategyList,
                        onChanged: _setSelectedStrategyIndex,
                      ),
                      OrderSummary(
                        shippingCostsStrategy:
                            _shippingCostsStrategyList[_selectedStrategyIndex],
                        order: _order,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
