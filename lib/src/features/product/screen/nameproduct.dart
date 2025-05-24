import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/image.dart';

class ProductNameAndImageSection extends StatelessWidget {
  final TextEditingController nameController;

  const ProductNameAndImageSection({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    TextStyle? textStyle2;
    if (screenWidth < 600) {
      textStyle = textTheme(context).titleSmall;
      textStyle2 = textTheme(context).bodyMedium;
    } else if (screenWidth < 1024) {
      textStyle = textTheme(context).bodyMedium;
      textStyle2 = textTheme(context).bodySmall;
    } else {
      textStyle = textTheme(context).bodyMedium;
      textStyle2 = textTheme(context).labelLarge;
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name & Images",
            style: textStyle?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Product Title",
                style: textStyle2?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 6),
              Icon(Icons.error_outline,
                  color: colorScheme(context).onSecondary, size: 18),
              SizedBox(width: 4),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            hint: "Enter product name",
            fillColor: Colors.white,
            maxLength: 100,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[^\x00-\x7F]|<[^>]*>')),
            ],
          ),
          const SizedBox(height: 20),
          const ImageUploadBox(),
        ],
      ),
    );
  }
}
