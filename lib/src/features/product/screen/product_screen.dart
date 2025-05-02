import 'package:flutter/material.dart';

import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/compatibilite.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/minmax.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/nameproduct.dart';

class ProductFormScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();

  ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorScheme(context).onTertiary,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductNameAndImageSection(nameController: nameController),
              const SizedBox(height: 20),
              MinMaxFields(
                priceController: priceController,
                minController: minController,
                maxController: maxController,
              ),
              const SizedBox(height: 30),
              const CategoryAndCompatibilitySelector(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
