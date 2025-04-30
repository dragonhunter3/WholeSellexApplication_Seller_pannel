import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_button.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/conteroller/controller.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/model/model.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ShowAllProducts extends StatefulWidget {
  const ShowAllProducts({super.key});

  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  TextEditingController controller = TextEditingController();
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
            mobileLayout: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        customDropdownButton(),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 80,
                          child: CustomButton(
                              borderRadius: 5,
                              textSize: 12,
                              onTap: () {},
                              text: "Filter"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.4,
                          child: CustomTextFormField(
                            controller: controller,
                            hint: "Search product",
                            borderRadius: 5,
                            fillColor: colorScheme(context).onPrimary,
                            textStyle: textTheme(context).bodyMedium,
                            hintColor:
                                colorScheme(context).onSurface.withOpacity(0.3),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: CustomButton(
                              borderRadius: 5,
                              textSize: 12,
                              onTap: () {},
                              text: "Search"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    customCategorybutton(),
                    SizedBox(height: 20),
                    customTable()
                  ],
                ),
              ),
            ),
            tabletLayout: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customDropdownButton(),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 80,
                        child: CustomButton(
                            borderRadius: 5,
                            textSize: 12,
                            onTap: () {},
                            text: "Filter"),
                      ),
                      Spacer(),
                      SizedBox(
                        height: height * 0.07,
                        width: width * 0.3,
                        child: CustomTextFormField(
                          controller: controller,
                          hint: "Search product",
                          borderRadius: 5,
                          fillColor: colorScheme(context).onPrimary,
                          textStyle: textTheme(context).labelLarge,
                          hintColor:
                              colorScheme(context).onSurface.withOpacity(0.3),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: CustomButton(
                            borderRadius: 5,
                            textSize: 12,
                            onTap: () {},
                            text: "Search"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  customCategorybutton(),
                  SizedBox(height: 20),
                  customTable()
                ],
              ),
            ),
            desktopLayout: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customDropdownButton(),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 80,
                        child: CustomButton(
                            borderRadius: 5,
                            textSize: 12,
                            onTap: () {},
                            text: "Filter"),
                      ),
                      Spacer(),
                      SizedBox(
                        height: height * 0.07,
                        width: width * 0.2,
                        child: CustomTextFormField(
                          controller: controller,
                          hint: "Search product",
                          borderRadius: 5,
                          fillColor: colorScheme(context).onPrimary,
                          textStyle: textTheme(context).labelMedium,
                          hintColor:
                              colorScheme(context).onSurface.withOpacity(0.3),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: CustomButton(
                            borderRadius: 5,
                            textSize: 12,
                            onTap: () {},
                            text: "Search"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  customCategorybutton(),
                  SizedBox(height: 20),
                  customTable()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customDropdownButton() {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodySmall;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    final provider = Provider.of<DateProvider>(context);
    final selectedDate = provider.selectedDate;
    final dateList = provider.dateList;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: colorScheme(context).onSurface,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedDate,
          icon: Icon(Icons.arrow_drop_down),
          dropdownColor: Colors.white,
          style: textStyle?.copyWith(
              color: colorScheme(context).onSurface.withOpacity(0.3)),
          onChanged: (String? newValue) {
            if (newValue != null) {
              provider.setSelectedDate(newValue);
            }
          },
          items: dateList.map((String date) {
            return DropdownMenuItem<String>(
              value: date,
              child: Text(
                date,
                style: textStyle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget customCategorybutton() {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodySmall;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    final provider = Provider.of<CategoryProvider>(context);
    final selected = provider.selectedCategory;
    final list = provider.categoryList;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: colorScheme(context).onSurface),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: Colors.white,
          style: textStyle,
          onChanged: (String? value) {
            if (value != null) {
              provider.setSelectedCategory(value);
            }
          },
          items: list.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category, style: textStyle),
            );
          }).toList(),
        ),
      ),
    );
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
            DataColumn(
                label: Text("Action",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
          ],
          rows: product.map((product) {
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
              DataCell(Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 150,
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You wanna Delete This item",
                                      style: textStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 80,
                                          child: CustomButton(
                                              onTap: () {},
                                              text: "Yes",
                                              borderRadius: 5),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 80,
                                          child: CustomButton(
                                              onTap: () {
                                                context.pop();
                                              },
                                              text: "No",
                                              borderRadius: 5),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(Icons.delete_outline)),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {}, child: Icon(Icons.edit_outlined))
                ],
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
