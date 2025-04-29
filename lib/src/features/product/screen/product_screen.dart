import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/product_provider.dart';

import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/image.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/widget/textfied.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ProductFormScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();

  ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme(context).onPrimary,
        appBar: AppBar(title: const Text("Product")),
        body: LayoutBuilder(
          builder: (context, constraints) => ResponsiveLayout(
            mobileLayout: Container(),
            tabletLayout: Container(),
            desktopLayout: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Container(
                  // color: colorScheme(context).onPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField1(
                        controller: nameController,
                        keyboardType: TextInputType.number,
                        hint: "product name",
                      ),
                      const SizedBox(height: 20),
                  
                      // DescriptionSection(),
                      const SizedBox(height: 20),
                      const ImageUploadBox(),
                      const SizedBox(height: 20),
                  
                      const Text(
                        "Price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CustomTextFormField1(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        hint: "0",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Container(
                            height: 46,
                            width: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.attach_money,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minHeight: 46,
                          minWidth: 40,
                        ),
                      ),
                  
                      const SizedBox(height: 20),
                  
                      Consumer<ProductProvider>(
                        builder: (context, provider, child) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Enable Min/Max Amount",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Switch(
                                    value: provider.settingEnabled,
                                    onChanged: provider.toggleSetting,
                                  ),
                                ],
                              ),
                              if (provider.settingEnabled) ...[
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextFormField1(
                                        controller: minController,
                                        keyboardType: TextInputType.number,
                                        hint: "min",
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          child: Container(
                                            height: 46,
                                            width: 45,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Icon(
                                                Icons.attach_money,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                          minHeight: 46,
                                          minWidth: 40,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CustomTextFormField1(
                                        controller: maxController,
                                        keyboardType: TextInputType.number,
                                        hint: "max",
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          child: Container(
                                            height: 46,
                                            width: 45,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Icon(
                                                Icons.attach_money,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                          minHeight: 46,
                                          minWidth: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
