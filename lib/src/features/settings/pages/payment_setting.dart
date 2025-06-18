import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_button.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void _addPaymentMethod() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment method added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveLayout(
          mobileLayout: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Add Payment Method",
                    style: textTheme(context)
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: _cardHolderController,
                    fillColor: Colors.white,
                    hint: "Enter name",
                    borderColor: Colors.grey,
                    focusBorderColor: Colors.grey,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter cardholder name' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _cardNumberController,
                    borderColor: Colors.grey,
                    hint: "Card number",
                    keyboardType: TextInputType.number,
                    fillColor: Colors.white,
                    maxLength: 16,
                    focusBorderColor: Colors.grey,
                    validator: (value) =>
                        value!.length < 16 ? 'Enter a valid card number' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _expiryDateController,
                          borderColor: Colors.grey,
                          hint: 'MM/YY',
                          fillColor: Colors.white,
                          maxLength: 5,
                          focusBorderColor: Colors.grey,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter expiry date' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          borderColor: Colors.grey,
                          focusBorderColor: Colors.grey,
                          controller: _cvvController,
                          fillColor: Colors.white,
                          hint: "Enter CVV",
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.length != 3 ? 'Enter valid CVV' : null,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(onTap: _addPaymentMethod, text: "ADD CARD")
                ],
              ),
            ),
          ),
          tabletLayout: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Add Payment Method",
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: _cardHolderController,
                    fillColor: Colors.white,
                    hint: "Enter name",
                    borderColor: Colors.grey,
                    focusBorderColor: Colors.grey,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter cardholder name' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _cardNumberController,
                    borderColor: Colors.grey,
                    hint: "Card number",
                    keyboardType: TextInputType.number,
                    fillColor: Colors.white,
                    maxLength: 16,
                    focusBorderColor: Colors.grey,
                    validator: (value) =>
                        value!.length < 16 ? 'Enter a valid card number' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _expiryDateController,
                          borderColor: Colors.grey,
                          hint: 'MM/YY',
                          fillColor: Colors.white,
                          maxLength: 5,
                          focusBorderColor: Colors.grey,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter expiry date' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          borderColor: Colors.grey,
                          focusBorderColor: Colors.grey,
                          controller: _cvvController,
                          fillColor: Colors.white,
                          hint: "Enter CVV",
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.length != 3 ? 'Enter valid CVV' : null,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(onTap: _addPaymentMethod, text: "ADD CARD")
                ],
              ),
            ),
          ),
          desktopLayout: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Add Payment Method",
                    style: textTheme(context)
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: _cardHolderController,
                    fillColor: Colors.white,
                    hint: "Enter name",
                    borderColor: Colors.grey,
                    focusBorderColor: Colors.grey,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter cardholder name' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _cardNumberController,
                    borderColor: Colors.grey,
                    hint: "Card number",
                    keyboardType: TextInputType.number,
                    fillColor: Colors.white,
                    maxLength: 16,
                    focusBorderColor: Colors.grey,
                    validator: (value) =>
                        value!.length < 16 ? 'Enter a valid card number' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _expiryDateController,
                          borderColor: Colors.grey,
                          hint: 'MM/YY',
                          fillColor: Colors.white,
                          maxLength: 5,
                          focusBorderColor: Colors.grey,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter expiry date' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          borderColor: Colors.grey,
                          focusBorderColor: Colors.grey,
                          controller: _cvvController,
                          fillColor: Colors.white,
                          hint: "Enter CVV",
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.length != 3 ? 'Enter valid CVV' : null,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(onTap: _addPaymentMethod, text: "ADD CARD")
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
