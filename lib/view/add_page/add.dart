// ignore_for_file: use_build_context_synchronously

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/itemcontroller/item_controller.dart';
import 'package:task/model/datamodel.dart';
import 'package:task/view/add_page/add_widget/add_widget.dart';
import 'package:task/widgets/navigator_widget.dart';
import 'package:task/widgets/snackbar_widget.dart';
import 'package:task/widgets/text_widget.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ItemController>(context);
    return pro.isLoading
        ? Scaffold(
            body: Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.blue, size: 40),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: TextWidget().text(data: "Add Item", color: Colors.black),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  NavigatorHelper().pop(context: context);
                },
                icon: const Icon(EneftyIcons.arrow_left_3_outline),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget().text(
                        data: "Add Product Images",
                        size: 18.0,
                        weight: FontWeight.bold),
                    const SizedBox(height: 16),
                    const SizedBox(height: 24),
                    const AddWidget(),
                    const SizedBox(height: 24),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton.extended(
                          elevation: 0,
                          backgroundColor: Colors.blue,
                          onPressed: () async {
                            await pro.startLoading(true);
                            await addData(context);
                            await pro.startLoading(false);
                            Navigator.pop(context);
                            SnackBarWidget().topsnackBar(context,
                                message:
                                    "Good job, your Item is Added Successfully");
                          },
                          label: TextWidget()
                              .text(data: "Add Item", color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  addData(context) async {
    final getProvider = Provider.of<ItemController>(context, listen: false);
    final product = DataModel(
      dataname: getProvider.nameController.text,
      description: getProvider.descriptionController.text,
      date: getProvider.selectedDate.toString(),
      time: getProvider.selectedTime.toString(),
    );
    getProvider.addProduct(product);
    getProvider.clearControllers();
    getProvider.productImages.clear();
  }
}
