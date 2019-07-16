import 'package:flutter/material.dart';

class TextView {
  static Widget getTextColorView(String text, Color color, var size) {
    return Container(
      child: Text(
        text,
        softWrap: false,
        style: TextStyle(
          fontSize: size,
          color: color,
        ),
      ),
    );
  }

  static Widget getTextView(String text, var size) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
        ),
      ),
    );
  }

  static Widget getTextViewPading16(String text, var size) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
        ),
      ),
    );
  }

  static Widget drawDivider8() {
    return Container(
        alignment: FractionalOffset.center,
        padding: const EdgeInsets.only(top: 8),
        child: Divider(
          height: 1.0,
          color: Color(0xFFF5F5F5),
        ));
  }

  static Widget drawDivider() {
    return Container(
        alignment: FractionalOffset.center,
        child: Divider(
          height: 1.0,
          color: Color(0xFFF5F5F5),
        ));
  }
}
