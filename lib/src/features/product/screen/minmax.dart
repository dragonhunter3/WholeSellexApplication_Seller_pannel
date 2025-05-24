import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/product_provider.dart';

class MinMaxFields extends StatefulWidget {
  final TextEditingController priceController;
  final TextEditingController minController;
  final TextEditingController maxController;

  const MinMaxFields({
    super.key,
    required this.priceController,
    required this.minController,
    required this.maxController,
  });

  @override
  State<MinMaxFields> createState() => _MinMaxFieldsState();
}

class _MinMaxFieldsState extends State<MinMaxFields> {
  String? minMaxErrorText;

  @override
  void initState() {
    super.initState();
    widget.minController.addListener(_validateMinMax);
    widget.maxController.addListener(_validateMinMax);
  }

  void _validateMinMax() {
    final min = double.tryParse(widget.minController.text.trim());
    final max = double.tryParse(widget.maxController.text.trim());

    if (min != null && max != null && min >= max) {
      setState(() {
        minMaxErrorText = "Min value must be less than Max value";
      });
    } else {
      setState(() {
        minMaxErrorText = null;
      });
    }
  }

  Widget _moneyIconBox(TextStyle? textStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: 46,
        width: 45,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.appOrange,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "PKR",
            style: textStyle?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final productProvider = Provider.of<ProductPro>(context);

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
              "Price",
              style: textStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Amount",
                  style: textStyle2?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.error_outline,
                  color: colorScheme(context).onSecondary,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 6),
            CustomTextFormField(
              controller: widget.priceController,
              keyboardType: TextInputType.number,
              hint: "0",
              prefixIcon: _moneyIconBox(textStyle2),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              prefixConstraints:
                  const BoxConstraints(minHeight: 46, minWidth: 40),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enable Min/Max Amount",
                  style: textStyle2?.copyWith(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: productProvider.settingEnabled,
                  onChanged: productProvider.toggleSetting,
                ),
              ],
            ),
            if (productProvider.settingEnabled)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  screenWidth < 500
                      ? Column(
                          children: [
                            CustomTextFormField(
                              controller: widget.minController,
                              keyboardType: TextInputType.number,
                              hint: "min",
                              prefixIcon: _moneyIconBox(textStyle2),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d{0,2}')),
                              ],
                              prefixConstraints: const BoxConstraints(
                                  minHeight: 46, minWidth: 40),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: widget.maxController,
                              keyboardType: TextInputType.number,
                              hint: "max",
                              prefixIcon: _moneyIconBox(textStyle2),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d{0,2}')),
                              ],
                              prefixConstraints: const BoxConstraints(
                                  minHeight: 46, minWidth: 40),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                controller: widget.minController,
                                keyboardType: TextInputType.number,
                                hint: "min",
                                prefixIcon: _moneyIconBox(textStyle2),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d{0,2}')),
                                ],
                                prefixConstraints: const BoxConstraints(
                                    minHeight: 46, minWidth: 40),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextFormField(
                                controller: widget.maxController,
                                keyboardType: TextInputType.number,
                                hint: "max",
                                prefixIcon: _moneyIconBox(textStyle2),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d{0,2}')),
                                ],
                                prefixConstraints: const BoxConstraints(
                                    minHeight: 46, minWidth: 40),
                              ),
                            ),
                          ],
                        ),
                  if (minMaxErrorText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6, left: 4),
                      child: Text(
                        minMaxErrorText!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.minController.removeListener(_validateMinMax);
    widget.maxController.removeListener(_validateMinMax);
    super.dispose();
  }
}
