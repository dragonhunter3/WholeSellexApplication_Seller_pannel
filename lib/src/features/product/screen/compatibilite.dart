import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/categry_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/category.dart';

class CategoryAndCompatibilitySelector extends StatelessWidget {
  const CategoryAndCompatibilitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Category>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme(context).onPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Category & attibutes",
                  style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),),
                
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.error_outline, color: colorScheme(context).onSecondary, size: 18),
                  ],
                ),
                const SizedBox(height: 10),
                CategoryDropdown(
                  categories: const [
                    'Purchase now',
                    'Free download',
                    'Subscription',
                  ],
                  selectedCategory: provider.selectedCategory,
                  onChanged: (value) {
                    if (value != null) {
                      provider.changeCategory(value);
                    }
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  "Compatibility",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.compatibilities.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    final item = provider.compatibilities[index];
                    final selected = provider.selectedCompatibilities.contains(
                      item,
                    );

                    return GestureDetector(
                      onTap: () => provider.toggleCompatibility(item),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              selected
                                  ? colorScheme(context).primary
                                  :   colorScheme(context).outline,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: selected ? colorScheme(context).onError : colorScheme(context).onSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  "Selected Compatibility",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: TextEditingController(
                    text: provider.selectedCompatibilities.join(', '),
                  ),
                  readOnly: true,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Selected compatibilities',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
