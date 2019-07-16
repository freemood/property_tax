import 'package:flutter/material.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/view/text_view.dart';

// 组合view
class CombinationView {
  static Widget showItmeView(IconData icon, String title) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
            size: 32,
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child: TextView.getTextColorView(
                    title, Colors.black, Dimens.FONT_SIZE_16),
              )),
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
