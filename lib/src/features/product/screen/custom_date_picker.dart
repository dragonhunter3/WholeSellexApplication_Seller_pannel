import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/date_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/schduke_provider.dart';

class DatePickerContent extends StatelessWidget {
  const DatePickerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DatePicker>(context);
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyLarge;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodyMedium;
    } else {
      textStyle = textTheme(context).bodySmall;
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Starting bidding time", style: textStyle),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              dateProvider.setCurrentDateTime();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Current: ${dateProvider.currentDateTime}',
                  style: textStyle),
            ),
          ),
          const SizedBox(height: 30),
          Text("Ending bidding time", style: textStyle),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () async {
              DateTime now = DateTime.now();

              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: now,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  final fullDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                  dateProvider.setSelectedDate(fullDateTime);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Selected: ${dateProvider.selectedDate}',
                  style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleProduct extends StatelessWidget {
  const ScheduleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<SchedulePro>(context);
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyLarge;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodyMedium;
    } else {
      textStyle = textTheme(context).bodySmall;
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select product Date and Time ", style: textStyle),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () async {
              DateTime now = DateTime.now();

              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: now,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  final fullDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                  scheduleProvider.setSelectedDate(fullDateTime);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Selected: ${scheduleProvider.selectedDate}',
                  style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}
