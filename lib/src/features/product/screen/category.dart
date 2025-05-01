import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';

class CategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String?) onChanged;

  const CategoryDropdown({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 1,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme(context).outline),
          borderRadius: BorderRadius.circular(6),
        ),
        child: DropdownButton<String>(
          value: selectedCategory,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          items: categories.map((cat) {
            return DropdownMenuItem(
              value: cat,
              child: Text(
                cat,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          style:
              TextStyle(fontSize: 13, color: colorScheme(context).onSecondary),
        ),
      ),
    );
  }
}
