import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';
import 'package:whole_sellex_selleradmin_pannel/src/schedule/provider/scheduleprovider.dart';

class Productsschedule extends StatefulWidget {
  const Productsschedule({super.key});

  @override
  State<Productsschedule> createState() => _ProductsscheduleState();
}

class _ProductsscheduleState extends State<Productsschedule> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ScheduleProvider>(context, listen: false)
        .fetchScheduledProducts());
  }

  var height;
  var width;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
            mobileLayout: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: 20), customTable(context)],
                ),
              ),
            ),
            tabletLayout: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: 20), customTable(context)],
              ),
            ),
            desktopLayout: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: 20), customTable(context)],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget customTable(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final provider = Provider.of<ScheduleProvider>(context);
  final products = provider.visibleProducts;
  final selections = provider.selections;

  TextStyle? textStyle;
  if (width < 600) {
    textStyle = Theme.of(context).textTheme.bodyMedium;
  } else if (width < 1024) {
    textStyle = Theme.of(context).textTheme.labelLarge;
  } else {
    textStyle = Theme.of(context).textTheme.labelMedium;
  }

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Center(child: Text('Product', style: textStyle))),
            Expanded(child: Center(child: Text('Price', style: textStyle))),
            Expanded(
                child: Center(child: Text('Schedule Time', style: textStyle))),
            Expanded(child: Center(child: Text('Edit', style: textStyle))),
            Expanded(child: Center(child: Text('Delete', style: textStyle))),
          ],
        ),
      ),
      SizedBox(
        height: height * 0.55,
        child: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : products.isEmpty
                ? Center(
                    child: Text(
                      provider.error ?? 'No scheduled products found',
                      style: textStyle,
                    ),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final formattedDate = product.scheduleTime != null
                          ? DateFormat('yyyy-MM-dd HH:mm')
                              .format(product.scheduleTime!)
                          : 'N/A';
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: selections[index],
                                      onChanged: (val) {
                                        provider.toggleSelection(index, val!);
                                      },
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: product.imageUrl != null &&
                                              product.imageUrl!.isNotEmpty
                                          ? Image.network(
                                              product.imageUrl!,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                print(
                                                    'Image load error for ${product.imageUrl}: $error'); // Debug log
                                                return Image.asset(
                                                  AppImages.shose,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.asset(
                                              AppImages.shose,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.title,
                                            style: textStyle?.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            product.category,
                                            style: textStyle?.copyWith(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "\$${product.price.toStringAsFixed(2)}",
                                    style: textStyle?.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(formattedDate, style: textStyle),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.edit_outlined),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Delete Product",
                                            style: textStyle),
                                        content: const Text(
                                            "Are you sure you want to delete this product?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("No"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              provider.deleteProduct(index);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Yes"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    ],
  );
}
