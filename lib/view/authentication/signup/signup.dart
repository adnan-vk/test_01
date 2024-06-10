// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authenticationcontroller/authcontroller.dart';
import 'package:task/view/authentication/login_screen/login.dart';
import 'package:task/view/authentication/signup/widget/signup_widget.dart';
import 'package:task/widgets/button_widget.dart';
import 'package:task/widgets/snackbar_widget.dart';
import 'package:task/widgets/text_widget.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    Navigator.pop(context);
                    pro.clearControllers();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                TextWidget().text(
                    data: "Create an Account",
                    size: 25.0,
                    weight: FontWeight.bold),
                const SizedBox(
                  height: 20,
                ),
                SignupWidget().textfields(context: context),
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
                            pro.signUpEmail(pro.emailController.text,
                                pro.passwordController.text);
                            await pro.addUser();
                            Navigator.pop(context);
                            SnackBarWidget().iconSnackSuccess(context,
                                label: "Account has been created successfully");
                            pro.clearControllers();
                          } catch (e) {
                            SnackBarWidget().iconSnackFail(context,
                                label: "Account not created, try again");
                          }
                        }
                      },
                      label: TextWidget()
                          .text(data: "SignUp", color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextWidget().text(
                        data: "Already have an Account? ",
                        color: Colors.grey,
                        size: 8.0),
                    ButtonWidget().textbutton(
                      text: "Login",
                      weight: FontWeight.bold,
                      context: context,
                      pushpage: Login(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
