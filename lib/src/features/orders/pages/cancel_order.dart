import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/orders/widgets/lists_orders.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => ResponsiveLayout(
        mobileLayout: Padding(
          padding: EdgeInsets.all(16),
          child: Expanded(child: customTable()),
        ),
        tabletLayout: Padding(
          padding: EdgeInsets.all(16),
          child: Expanded(child: customTable()),
        ),
        desktopLayout: Padding(
          padding: EdgeInsets.all(16),
          child: Expanded(child: customTable()),
        ),
      ),
    ));
  }

  Widget customTable() {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    return SizedBox(
      height: height * 0.5,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columnSpacing: 120,
          columns: [
            DataColumn(
                label: Text("Image",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Product\nName",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Status",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Stock",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Price",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Date",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
          ],
          rows: cancel.map((product) {
            return DataRow(cells: [
              DataCell(Image.asset(
                product.image,
                width: 40,
                height: 40,
              )),
              DataCell(Text(product.productName, style: textStyle)),
              DataCell(Text(product.status, style: textStyle)),
              DataCell(Text(product.stock, style: textStyle)),
              DataCell(Text('Rs ${product.price}', style: textStyle)),
              DataCell(Text(product.date, style: textStyle)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
