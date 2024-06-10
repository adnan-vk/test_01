// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/itemcontroller/item_controller.dart';
import 'package:task/model/datamodel.dart';
import 'package:task/widgets/navigator_widget.dart';
import 'package:task/widgets/snackbar_widget.dart';

class EditPage extends StatefulWidget {
  DataModel data;
  EditPage({super.key, required this.data});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.data.dataname);
    descriptionController =
        TextEditingController(text: widget.data.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ItemController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product Details'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            NavigatorHelper().pop(context: context);
          },
          icon: const Icon(EneftyIcons.arrow_left_3_outline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
            const SizedBox(height: 20),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
            ElevatedButton(
              onPressed: () async {
                await pro.startLoading(true);
                await updateProduct(context, widget.data);
                await pro.startLoading(false);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  updateProduct(context, DataModel product) async {
    final getProvider = Provider.of<ItemController>(context, listen: false);
    product.dataname = nameController.text;
    product.description = descriptionController.text;
    await getProvider.updateProduct(product.id, product);
    Navigator.pop(context);
    Navigator.pop(context);
    SnackBarWidget()
        .iconSnackSuccess(context, label: "Product updated successfully");
  }
}
