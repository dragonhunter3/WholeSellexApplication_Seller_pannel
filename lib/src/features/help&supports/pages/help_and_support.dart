import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      'Track My Order',
      'Payments & Refunds',
      'Return & Exchange',
      'Cancel Order',
      'Account Issues',
    ];

    final faqs = [
      {
        'question': 'How do I return an item?',
        'answer': 'You can request a return from the Orders section.'
      },
      {
        'question': 'When will I get my refund?',
        'answer': 'Refunds are processed within 5-7 business days.'
      },
      {
        'question': 'How can I contact customer service?',
        'answer': 'You can chat, email, or call us directly.'
      },
    ];

    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveLayout(
          mobileLayout: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hint: "Search help topics...",
                    fillColor: Colors.white,
                    focusBorderColor: Colors.grey,
                    borderColor: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Popular Topics',
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...topics.map((topic) => ListTile(
                        title: Text(
                          topic,
                          style: textTheme(context).bodyMedium,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      )),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    'Need More Help?',
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContactButton(
                          context, Icons.chat_bubble_outline, 'Chat'),
                      _buildContactButton(
                          context, Icons.email_outlined, 'Email'),
                      _buildContactButton(context, Icons.call_outlined, 'Call'),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    'FAQs',
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...faqs.map((faq) => ExpansionTile(
                        title: Text(faq['question']!,
                            style: textTheme(context).bodyMedium),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(faq['answer']!,
                                style: textTheme(context).bodyMedium),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          tabletLayout: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hint: "Search help topics...",
                    fillColor: Colors.white,
                    focusBorderColor: Colors.grey,
                    borderColor: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Popular Topics',
                    style: textTheme(context)
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...topics.map((topic) => ListTile(
                        title: Text(
                          topic,
                          style: textTheme(context).bodySmall,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      )),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    'Need More Help?',
                    style: textTheme(context)
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContactButton(
                          context, Icons.chat_bubble_outline, 'Chat'),
                      _buildContactButton(
                          context, Icons.email_outlined, 'Email'),
                      _buildContactButton(context, Icons.call_outlined, 'Call'),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    'FAQs',
                    style: textTheme(context)
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...faqs.map((faq) => ExpansionTile(
                        title: Text(faq['question']!,
                            style: textTheme(context).bodySmall),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(faq['answer']!,
                                style: textTheme(context).bodySmall),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          desktopLayout: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hint: "Search help topics...",
                    fillColor: Colors.white,
                    focusBorderColor: Colors.grey,
                    borderColor: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Popular Topics',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...topics.map((topic) => ListTile(
                        title: Text(
                          topic,
                          style: textTheme(context).labelLarge,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      )),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    'Need More Help?',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContactButton(
                          context, Icons.chat_bubble_outline, 'Chat'),
                      _buildContactButton(
                          context, Icons.email_outlined, 'Email'),
                      _buildContactButton(context, Icons.call_outlined, 'Call'),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    'FAQs',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...faqs.map((faq) => ExpansionTile(
                        title: Text(faq['question']!,
                            style: textTheme(context).labelLarge),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(faq['answer']!,
                                style: textTheme(context).labelLarge),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  Widget _buildContactButton(
      BuildContext context, IconData icon, String label) {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    double? size;
    double? iconsize;

    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
      size = 15;
      iconsize = 15;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodySmall;
      size = 20;
      iconsize = 15;
    } else {
      textStyle = textTheme(context).labelLarge;
      size = 24;
      iconsize = 20;
    }
    return Column(
      children: [
        CircleAvatar(
          radius: size,
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: iconsize,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: textStyle),
      ],
    );
  }
}
