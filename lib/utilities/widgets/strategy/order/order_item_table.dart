import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/stragegy/order/order_item.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';

class OrderItemsTable extends StatelessWidget {
  final List<OrderItem> orderItems;

  const OrderItemsTable({
    @required this.orderItems,
  }) : assert(orderItems != null);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: spaceL,
      horizontalMargin: marginM,
      headingRowHeight: spaceXL,
      dataRowHeight: spaceXL,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Package Size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Price',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          numeric: true,
        ),
      ],
      rows: <DataRow>[
        for (var orderItem in orderItems)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(orderItem.title)),
              DataCell(Text(orderItem.packageSize.toString().split('.').last)),
              DataCell(Text('\$${orderItem.price.toStringAsFixed(2)}')),
            ],
          ),
      ],
    );
  }
}
