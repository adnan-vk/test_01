import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authenticationcontroller/authcontroller.dart';
import 'package:task/view/add_page/add.dart';
import 'package:task/view/authentication/login_screen/login.dart';
import 'package:task/view/home/home_widgets/home_widget.dart';
import 'package:task/widgets/navigator_widget.dart';
import 'package:task/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () async {
              logout(context);
            },
            icon: const Icon(EneftyIcons.login_outline),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .020,
            ),
            SizedBox(height: size.height * .015),
            HomeWidgets().productList(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigatorHelper().push(
            context: context,
            page: const AddData(),
          );
        },
        child: const Icon(EneftyIcons.add_square_outline),
      ),
    );
  }

  logout(context) {
    final pro = Provider.of<AuthController>(context, listen: false);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextWidget().text(data: "Logout"),
          content: TextWidget().text(data: "Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextWidget().text(data: "Cancel", weight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                pro.signOutEmail();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false,
                );
              },
              child: TextWidget().text(data: "Logout", weight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
