import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  var buttonPressed;
  MyButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonPressed(buttonText),
      child: Container(
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .1,
        color: buttonColor,
        child: Center(
          child: Text(
            buttonText,
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
