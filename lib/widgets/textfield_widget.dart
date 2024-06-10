// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class textFormField {
  textformfield(
      {controller,
      cnfcontroller,
      hinttext,
      onchange,
      validator,
      String? type,
      keytype,
      max,
      minline,
      color,
      maxline,
      icon,
      bool obsc = false,
      required Color shadowColor,
      required int radius}) {
    TextEditingController cnfcontroller = TextEditingController();
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $hinttext";
        } else if (type == "Email") {
          if (!EmailValidator.validate(value)) {
            return "Please enter a valid email address";
          }
        } else if (type == 'Password') {
          if (value.length < 6) {
            return 'Password should be at least 6 characters';
          }
        } else if (type == 'Confirm Password') {
          if (value == cnfcontroller.text) {
            return 'Passwords do not match';
          }
        } else if (type == 'OTP') {
          if (value.length != 6) {
            return "OTP must contains 6 characters";
          }
        } else if (type == 'phone') {
          if (value.length != 10) {
            return "Please Enter Valid Phone Number";
          }
        } else if (type == "firstName") {
          if (value.isEmpty) {
            return "please enter a name";
          }
        }
        return null;
      },
      obscureText: obsc,
      maxLines: maxline,
      minLines: minline,
      maxLength: max,
      keyboardType: keytype,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        hintText: hinttext,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: color,
        prefixIcon: icon,
      ),
      onChanged: (value) {
        onchange;
      },
    );
  }
}
