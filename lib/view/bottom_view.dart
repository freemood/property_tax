import 'package:flutter/material.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/view/text_view.dart';

class BottomView {
  static Widget showBottom(String name) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: TextView.getTextView(name, Dimens.FONT_SIZE_16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => {},
              ),
            ),
          ],
        ));
  }
}
