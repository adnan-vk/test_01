import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/itemcontroller/item_controller.dart';
import 'package:task/view/edit_page/edit.dart';
import 'package:task/widgets/text_widget.dart';

class HomeWidgets {
  final firebseauth = FirebaseAuth.instance.currentUser;
  productList(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<ItemController>(context, listen: false);
    pro.getItem();
    return Expanded(
      child: Consumer<ItemController>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.allproducts.length,
          itemBuilder: (context, index) {
            final item = value.allproducts[index];
            return GestureDetector(
              onTap: () async {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 110,
                                child: TextWidget().text(
                                  data: "${item.dataname}",
                                  size: 20.0,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () async {},
                                borderRadius: BorderRadius.circular(50.0),
                                splashColor: Colors.grey.withOpacity(0.3),
                                highlightColor: Colors.red.withOpacity(0.1),
                                child: IconButton(
                                  onPressed: () {
                                    pro.deleteProduct(item.id);
                                  },
                                  icon: const Icon(
                                    Icons.check,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextWidget().text(
                          data: "${item.description}",
                          size: 13.0,
                        ),
                        SizedBox(height: size.height * .005),
                        TextWidget().text(
                          data: "${item.time}",
                          size: 13.0,
                        ),
                        SizedBox(height: size.height * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget().text(
                              data: "${item.date}",
                              size: 11.0,
                              color: Colors.grey,
                              weight: FontWeight.bold,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditPage(data: item),
                                    ),
                                  );
                                },
                                icon: const Icon(EneftyIcons.card_edit_outline))
                            // const Icon(
                            //   EneftyIcons.card_edit_outline,
                            //   color: Colors.red,
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
