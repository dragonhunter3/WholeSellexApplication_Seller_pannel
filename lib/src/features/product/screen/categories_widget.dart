import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/categoryprovider.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> categories;

  const CustomDropdown({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<ProductCategory>(context);
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodySmall;
    } else {
      textStyle = textTheme(context).labelLarge;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: categoryProvider.selectedCategory,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category, style: textStyle),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              categoryProvider.setSelectedCategory(newValue);
            }
          },
        ),
      ),
    );
  }
}
