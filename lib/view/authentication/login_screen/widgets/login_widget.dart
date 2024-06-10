// import 'package:enefty_icons/enefty_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/controller/authenticationcontroller/authcontroller.dart';
// import 'package:task/widgets/textfield_widget.dart';

// class SigninWidgets {
//   textfields(context) {
//     final size = MediaQuery.of(context).size;
//     final pro = Provider.of<AuthController>(context, listen: false);
//     return Column(
//       children: [
//         textFormField().textformfield(
//             keytype: TextInputType.emailAddress,
//             icon: const Icon(EneftyIcons.user_outline),
//             controller: pro.emailController,
//             hinttext: "Email Address",
//             type: "Email",
//             color: Colors.grey.shade200),
//         SizedBox(
//           height: size.height * .02,
//         ),
//         textFormField().textformfield(
//           maxline: 1,
//           obsc: true,
//           icon: const Icon(EneftyIcons.lock_outline),
//           controller: pro.passwordController,
//           hinttext: "Password",
//           type: "Password",
//           color: Colors.grey.shade200,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authenticationcontroller/authcontroller.dart';
import 'package:task/widgets/textfield_widget.dart';

class SigninWidgets {
  textfields(context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthController>(context, listen: false);
    return Column(
      children: [
        textFormField().textformfield(
          keytype: TextInputType.emailAddress,
          icon: const Icon(EneftyIcons.user_outline, color: Colors.blue),
          controller: pro.emailController,
          hinttext: "Email Address",
          type: "Email",
          color: Colors.white,
          radius: 30,
          shadowColor: Colors.black12,
        ),
        SizedBox(height: size.height * .02),
        textFormField().textformfield(
          maxline: 1,
          obsc: true,
          icon: const Icon(EneftyIcons.lock_outline, color: Colors.blue),
          controller: pro.passwordController,
          hinttext: "Password",
          type: "Password",
          color: Colors.white,
          radius: 30,
          shadowColor: Colors.black12,
        ),
      ],
    );
  }
}
