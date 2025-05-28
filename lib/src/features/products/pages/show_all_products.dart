import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_button.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/conteroller/controller.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/conteroller/show_all_products_controller.dart';

import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ShowAllProducts extends StatefulWidget {
  const ShowAllProducts({super.key});

  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ShowAllProductsController>(context, listen: false)
            .fetchProducts());
  }

  var height, width;
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
                    customTable(context)
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
                  customTable(context)
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
                  customTable(context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customCategorybutton() {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = Theme.of(context).textTheme.bodySmall;
    } else if (width < 1024) {
      textStyle = Theme.of(context).textTheme.labelLarge;
    } else {
      textStyle = Theme.of(context).textTheme.labelMedium;
    }
    final provider = Provider.of<CategoryProvider>(context);
    final selected = provider.selectedCategory;
    final list = provider.categoryList;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
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

  Widget customTable(BuildContext context) {
    final controller = Provider.of<ShowAllProductsController>(context);
    final products = controller.visibleProducts;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextStyle? textStyle;
    if (width < 600) {
      textStyle = Theme.of(context).textTheme.bodyMedium;
    } else if (width < 1024) {
      textStyle = Theme.of(context).textTheme.labelLarge;
    } else {
      textStyle = Theme.of(context).textTheme.labelMedium;
    }

    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.error != null) {
      return Center(child: Text(controller.error!, style: textStyle));
    }

    if (products.isEmpty) {
      return Center(child: Text('No products found', style: textStyle));
    }

    return SizedBox(
      height: height * 0.5,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: [
            DataColumn(label: Text("Image", style: textStyle)),
            DataColumn(label: Text("Product\nName", style: textStyle)),
            DataColumn(label: Text("Status", style: textStyle)),
            DataColumn(label: Text("Stock", style: textStyle)),
            DataColumn(label: Text("Price", style: textStyle)),
            DataColumn(label: Text("Date", style: textStyle)),
            DataColumn(label: Text("Action", style: textStyle)),
          ],
          rows: products.asMap().entries.map((entry) {
            final index = entry.key;
            final product = entry.value;
            return DataRow(cells: [
              DataCell(
                product.imageUrl != null && product.imageUrl!.isNotEmpty
                    ? Image.network(
                        product.imageUrl!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          print(
                              'Image load error for ${product.imageUrl}: $error');
                          return const Icon(Icons.image_not_supported);
                        },
                      )
                    : const Icon(Icons.image_not_supported),
              ),
              DataCell(Text(product.title, style: textStyle)),
              DataCell(Text(product.isBidding ? 'Bidding' : 'Simple',
                  style: textStyle)),
              DataCell(Text("N/A", style: textStyle)),
              DataCell(Text('Rs ${product.price.toStringAsFixed(2)}',
                  style: textStyle)),
              DataCell(Text(
                product.scheduleTime != null
                    ? DateFormat('yyyy-MM-dd').format(product.scheduleTime!)
                    : 'N/A',
                style: textStyle,
              )),
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
                              padding: const EdgeInsets.all(10),
                              height: 150,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("You want to delete this item?",
                                      style: textStyle),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 80,
                                        child: CustomButton(
                                          onTap: () {
                                            controller.deleteProduct(index);
                                            Navigator.pop(context);
                                          },
                                          text: "Yes",
                                          borderRadius: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 80,
                                        child: CustomButton(
                                          onTap: () => Navigator.pop(context),
                                          text: "No",
                                          borderRadius: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.delete_outline),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Implement edit functionality here
                    },
                    child: const Icon(Icons.edit_outlined),
                  ),
                ],
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
