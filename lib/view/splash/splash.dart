import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authenticationcontroller/authcontroller.dart';
import 'package:task/view/authentication/login_screen/login.dart';
import 'package:task/view/home/home.dart';
import 'package:task/widgets/navigator_widget.dart';
import 'package:task/widgets/text_widget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    goToLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget().text(data: "Test"),
      ),
    );
  }

  goToLogin(context) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final userPrvd = Provider.of<AuthController>(context, listen: false);

    if (currentUser == null) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      return NavigatorHelper().pushReplacement(
        context: context,
        replacementPage: Login(),
      );
    } else {
      const CircularProgressIndicator();
      await userPrvd.getUser();
      await Future.delayed(
        const Duration(seconds: 2),
      );
      return NavigatorHelper().pushReplacement(
        context: context,
        replacementPage: const HomeScreen(),
      );
    }
  }
}
