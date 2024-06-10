// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authenticationcontroller/authcontroller.dart';
import 'package:task/view/authentication/login_screen/widgets/login_widget.dart';
import 'package:task/view/authentication/signup/signup.dart';
import 'package:task/view/home/home.dart';
import 'package:task/widgets/button_widget.dart';
import 'package:task/widgets/snackbar_widget.dart';
import 'package:task/widgets/text_widget.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextWidget()
                    .text(data: "Login", size: 40.0, weight: FontWeight.bold),
                const SizedBox(
                  height: 20,
                ),
                SigninWidgets().textfields(context),
                SizedBox(
                  height: size.height * .03,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.blue,
                      elevation: 3,
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            await pro.signInEmail(pro.emailController.text,
                                pro.passwordController.text);
                            SnackBarWidget().iconSnackSuccess(context,
                                label: "User logged in successfully");
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                            pro.emailController.clear();
                            pro.passwordController.clear();
                          } catch (e) {
                            SnackBarWidget().iconSnackFail(context,
                                label: "Email or password incorrect,Try Again");
                          }
                        }
                        return;
                      },
                      label:
                          TextWidget().text(data: "Login", color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextWidget().text(
                        data: "Dont have an Account? ",
                        color: Colors.grey,
                        size: 8.0),
                    ButtonWidget().textbutton(
                        weight: FontWeight.bold,
                        text: "Create Account",
                        pushpage: SignUp(),
                        context: context)
                  ],
                ),
                SizedBox(height: size.height * .07),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
