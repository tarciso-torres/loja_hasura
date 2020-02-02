import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String title;

  const LabelWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final primaryColor = TextStyle(color: Theme.of(context).primaryColor);
    return Text(
      title, 
      style: primaryColor,
    );
  }
}
