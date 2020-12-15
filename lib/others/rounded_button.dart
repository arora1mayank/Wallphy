import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String text;
  final Color textColor;
  RoundedButton({this.text, this.color, this.onPressed, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        child: MaterialButton(
          minWidth: 200.0,
          height: 60.0,
          onPressed: onPressed,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
