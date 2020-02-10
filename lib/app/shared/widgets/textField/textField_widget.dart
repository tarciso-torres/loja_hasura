import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final controller;
  final String textEdit;

  const TextFieldWidget({Key key, @required this.hintText, this.textInputType = TextInputType.text, this.controller, this.textEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return TextField(
              onChanged: controller,
              keyboardType: textInputType,
              style: TextStyle(
                color: primaryColor, 
                fontSize: 18
              ),
              controller: TextEditingController(text: textEdit),
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 2
                  )
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: primaryColor,
                  width: 2
                )),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: primaryColor,
                  width: 2
                )),
              ),
            );
  }
}
