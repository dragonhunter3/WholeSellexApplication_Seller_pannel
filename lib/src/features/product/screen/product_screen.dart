import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/categoryprovider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/date_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/image_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/product_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/schduke_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/switch_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/categories_widget.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/custom_date_picker.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/minmax.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/nameproduct.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ProductFormScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final switchProvider = Provider.of<SwitchController>(context);
    final productProvider = Provider.of<ProductPro>(context);
    final categoryProvider = Provider.of<ProductCategory>(context);
    final dateProvider = Provider.of<DatePicker>(context);
    final scheduleProvider = Provider.of<SchedulePro>(context);
    final imageProvider = Provider.of<ImageController>(context);
    final List<String> categories = [
      "Electronics",
      "Clothing",
      "Books",
      "Toys",
      "Home & Garden",
    ];

    return Scaffold(
        backgroundColor: colorScheme(context).onTertiary,
        body: LayoutBuilder(
          builder: (context, constraints) => ResponsiveLayout(
            mobileLayout: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductNameAndImageSection(nameController: nameController),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      maxLines: 5,
                      fillColor: colorScheme(context).onPrimary,
                      hint: "Enter Discription",
                      controller: detailController,
                    ),
                    const SizedBox(height: 20),
                    MinMaxFields(
                      priceController: priceController,
                      minController: minController,
                      maxController: maxController,
                    ),
                    const SizedBox(height: 30),
                    if (!switchProvider.getSwitchValue('switch3')) ...[
                      Text(
                        "Select Category",
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomDropdown(categories: categories),
                    ],
                    const SizedBox(height: 20),
                    customRow(
                      "Add new Category",
                      context,
                      switchProvider.getSwitchValue('switch3'),
                      (val) => switchProvider.toggleSwitch('switch3', val),
                    ),
                    SizedBox(height: 20),
                    if (switchProvider.getSwitchValue('switch3')) ...[
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        fillColor: colorScheme(context).onPrimary,
                        hint: "Enter Catogory Name",
                        controller: categoryController,
                      ),
                    ],
                    SizedBox(height: 20),
                    customRow(
                      "Add this product on bidding",
                      context,
                      switchProvider.getSwitchValue('switch1'),
                      (val) => switchProvider.toggleSwitch('switch1', val),
                    ),
                    if (switchProvider.getSwitchValue('switch1')) ...[
                      SizedBox(height: 20),
                      DatePickerContent(),
                    ],
                    SizedBox(height: 20),
                    customRow(
                      "Schedule This product",
                      context,
                      switchProvider.getSwitchValue('switch2'),
                      (val) => switchProvider.toggleSwitch('switch2', val),
                    ),
                    if (switchProvider.getSwitchValue('switch2')) ...[
                      SizedBox(height: 20),
                      ScheduleProduct(),
                    ],
                  ],
                ),
              ),
            ),
            tabletLayout: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductNameAndImageSection(nameController: nameController),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      maxLines: 5,
                      fillColor: colorScheme(context).onPrimary,
                      hint: "Enter Discription",
                      controller: detailController,
                    ),
                    const SizedBox(height: 20),
                    MinMaxFields(
                      priceController: priceController,
                      minController: minController,
                      maxController: maxController,
                    ),
                    const SizedBox(height: 30),
                    if (!switchProvider.getSwitchValue('switch3')) ...[
                      Text(
                        "Select Category",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomDropdown(categories: categories),
                    ],
                    SizedBox(height: 20),
                    customRow(
                      "Add new Category",
                      context,
                      switchProvider.getSwitchValue('switch3'),
                      (val) => switchProvider.toggleSwitch('switch3', val),
                    ),
                    SizedBox(height: 20),
                    if (switchProvider.getSwitchValue('switch3')) ...[
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        fillColor: colorScheme(context).onPrimary,
                        hint: "Enter Catogory Name",
                        controller: categoryController,
                      ),
                    ],
                    SizedBox(height: 20),
                    customRow(
                      "Add this product on bidding",
                      context,
                      switchProvider.getSwitchValue('switch1'),
                      (val) => switchProvider.toggleSwitch('switch1', val),
                    ),
                    if (switchProvider.getSwitchValue('switch1')) ...[
                      SizedBox(height: 20),
                      DatePickerContent(),
                    ],
                    SizedBox(height: 20),
                    customRow(
                      "Schedule This product",
                      context,
                      switchProvider.getSwitchValue('switch2'),
                      (val) => switchProvider.toggleSwitch('switch2', val),
                    ),
                    if (switchProvider.getSwitchValue('switch2')) ...[
                      SizedBox(height: 20),
                      ScheduleProduct(),
                    ],
                  ],
                ),
              ),
            ),
            desktopLayout: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductNameAndImageSection(nameController: nameController),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      maxLines: 5,
                      fillColor: colorScheme(context).onPrimary,
                      hint: "Enter Description",
                      controller: detailController,
                    ),
                    const SizedBox(height: 20),
                    MinMaxFields(
                      priceController: priceController,
                      minController: minController,
                      maxController: maxController,
                    ),
                    const SizedBox(height: 30),
                    if (!switchProvider.getSwitchValue('switch3')) ...[
                      Text(
                        "Select Category",
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomDropdown(categories: productProvider.categories),
                    ],
                    const SizedBox(height: 20),
                    customRow(
                      "Add new Category",
                      context,
                      switchProvider.getSwitchValue('switch3'),
                      (val) => switchProvider.toggleSwitch('switch3', val),
                    ),
                    if (switchProvider.getSwitchValue('switch3')) ...[
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        fillColor: colorScheme(context).onPrimary,
                        hint: "Enter Category Name",
                        controller: categoryController,
                      ),
                    ],
                    const SizedBox(height: 20),
                    customRow(
                      "Add this product on bidding",
                      context,
                      switchProvider.getSwitchValue('switch1'),
                      (val) => switchProvider.toggleSwitch('switch1', val),
                    ),
                    if (switchProvider.getSwitchValue('switch1')) ...[
                      const SizedBox(height: 20),
                      const DatePickerContent(),
                    ],
                    const SizedBox(height: 20),
                    customRow(
                      "Schedule This product",
                      context,
                      switchProvider.getSwitchValue('switch2'),
                      (val) => switchProvider.toggleSwitch('switch2', val),
                    ),
                    if (switchProvider.getSwitchValue('switch2')) ...[
                      const SizedBox(height: 20),
                      const ScheduleProduct(),
                    ],
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.isEmpty ||
                            detailController.text.isEmpty ||
                            priceController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please fill all required fields')),
                          );
                          return;
                        }

                        double? minPrice = double.tryParse(minController.text);
                        double? maxPrice = double.tryParse(maxController.text);
                        if (productProvider.settingEnabled &&
                            (minPrice == null || maxPrice == null)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please enter valid min/max prices')),
                          );
                          return;
                        }

                        String category =
                            switchProvider.getSwitchValue('switch3')
                                ? categoryController.text
                                : categoryProvider.selectedCategory ??
                                    productProvider.categories[0];

                        if (switchProvider.getSwitchValue('switch3') &&
                            category.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter a category name')),
                          );
                          return;
                        }

                        try {
                          await productProvider.addProduct(
                            title: nameController.text,
                            description: detailController.text,
                            imageUrl: imageProvider.downloadUrl,
                            price: double.parse(priceController.text),
                            minPrice: productProvider.settingEnabled
                                ? minPrice
                                : null,
                            maxPrice: productProvider.settingEnabled
                                ? maxPrice
                                : null,
                            category: category,
                            isBidding: switchProvider.getSwitchValue('switch1'),
                            biddingStartTime:
                                switchProvider.getSwitchValue('switch1')
                                    ? dateProvider.currentDateTime
                                    : null,
                            biddingEndTime:
                                switchProvider.getSwitchValue('switch1')
                                    ? dateProvider.selectedDate
                                    : null,
                            isScheduled:
                                switchProvider.getSwitchValue('switch2'),
                            scheduleTime:
                                switchProvider.getSwitchValue('switch2')
                                    ? scheduleProvider.selectedDate
                                    : null,
                          );

                          if (switchProvider.getSwitchValue('switch3') &&
                              category.isNotEmpty) {
                            productProvider.addCategory(category);
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Product added successfully')),
                          );

                          // Clear form
                          nameController.clear();
                          detailController.clear();
                          priceController.clear();
                          minController.clear();
                          maxController.clear();
                          categoryController.clear();
                          imageProvider.clearImage();
                          switchProvider.toggleSwitch('switch1', false);
                          switchProvider.toggleSwitch('switch2', false);
                          switchProvider.toggleSwitch('switch3', false);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Failed to add product: $e')),
                          );
                        }
                      },
                      child: const Text('Add Product'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget customRow(String title, BuildContext context, bool value,
      Function(bool) onChanged) {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: textStyle?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
