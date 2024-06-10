// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/itemcontroller/item_controller.dart';
import 'package:task/widgets/textfield_widget.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({super.key});

  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ItemController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        textFormField().textformfield(
            keytype: TextInputType.name,
            controller: pro.nameController,
            hinttext: "Title",
            color: Colors.grey.shade200,
            shadowColor: Colors.black12,
            radius: 30),
        SizedBox(height: size.height * .016),
        textFormField().textformfield(
            controller: pro.descriptionController,
            maxline: 3,
            hinttext: "Description",
            color: Colors.grey.shade200,
            shadowColor: Colors.black12,
            radius: 30),
        SizedBox(height: size.height * .016),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                _selectedDate = pickedDate;
              });
              pro.setDate(pickedDate);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? DateFormat.yMMMd().format(_selectedDate!)
                      : "Select Date",
                  style: const TextStyle(color: Colors.black54),
                ),
                const Icon(Icons.calendar_today, color: Colors.black54),
              ],
            ),
          ),
        ),
        SizedBox(height: size.height * .016),
        GestureDetector(
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null) {
              setState(() {
                _selectedTime = pickedTime;
              });
              pro.setTime(pickedTime);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedTime != null
                      ? _selectedTime!.format(context)
                      : "Select Time",
                  style: const TextStyle(color: Colors.black54),
                ),
                const Icon(Icons.access_time, color: Colors.black54),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
