import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:task/widgets/navigator_widget.dart';
import 'package:task/widgets/text_widget.dart';

class ButtonWidget {
  elevatedbutton(
      {text, color, required context, page, textcolor, icon, iconcolor}) {
    return ElevatedButton(
      onPressed: () => NavigatorHelper()
          .pushReplacement(context: context, replacementPage: page),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(top: 10, bottom: 10),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      child: TextWidget().text(
        data: text,
        size: 20.0,
        color: textcolor,
      ),
    );
  }

  textbutton(
      {onpressed, text, pushpage, required context, replacementpage, weight}) {
    return GestureDetector(
      onTap: () {
        NavigatorHelper().push(context: context, page: pushpage);
      },
      child: TextWidget()
          .text(data: text, color: Colors.black, size: 8.0, weight: weight),
    );
  }
}
