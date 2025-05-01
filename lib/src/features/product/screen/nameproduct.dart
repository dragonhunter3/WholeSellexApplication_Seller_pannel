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
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(
            "Name & Images",
           style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children:  [
              Text(
                "Product Title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 6),
              Icon(Icons.error_outline, color: colorScheme(context).onSecondary, size: 18),

              SizedBox(width: 4),
              Card.filled(
                child: Text(
                  "Max 100 characters. No HTML or emoji allowed.",
                  style: TextStyle(fontSize: 12, color: colorScheme(context).onSecondary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            hint: "Enter product name",
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
