import 'package:flutter/material.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/view/bottom_view.dart';
import 'package:property_tax/view/text_view.dart';

class AppealView extends StatefulWidget {
  final String id;

  AppealView({Key key, @required this.id}) : super(key: key);

  @override
  _AppealViewState createState() => _AppealViewState(id);
}

class _AppealViewState extends State<AppealView> {
  _AppealViewState(id);

  var appealType = [
    Strings.HOUSING_VALUE_OBJECTION,
    Strings.TAX_DEDUCTION_OBJECTION,
    Strings.APP_OTHER
  ];

  var simpleDialogStr = Strings.APP_CHOOSE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.APPEAL_TITLE_STR),
        centerTitle: true,
      ),
      body: showView(),
    );
  }

  Widget showView() {
    return Column(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blue.shade200,
            elevation: 5.0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
              alignment: FractionalOffset.centerLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    alignment: FractionalOffset.centerLeft,
                    child: TextView.getTextView(
                        Strings.APPEAL_REASON, Dimens.FONT_SIZE_16),
                  ),
                  TextView.drawDivider8(),
                  showAppealType(),
                  TextView.drawDivider8(),
                  showAppealExplain(),
                  TextView.drawDivider8(),
                  BottomView.showBottom(Strings.BOTTOM_SUBMIT),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget showAppealExplain() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8),
      alignment: FractionalOffset.centerLeft,
      child: Row(
        children: <Widget>[
          Container(
            child: TextView.getTextView(
                Strings.SUPPLEMENTARY_NOTES, Dimens.FONT_SIZE_16),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 8),
            child: showTextField(),
          )),
        ],
      ),
    );
  }

  Widget showTextField() {
    return TextField(
      maxLength: 220,
      maxLines: 5,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          /*边角*/
//                borderRadius: BorderRadius.all(
//                  Radius.circular(30), //边角为30
//                ),
          borderSide: BorderSide(
            color: Colors.blueAccent, //边线颜色为黄色
            width: 1, //边线宽度为2
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue, //边框颜色为绿色
          width: 3, //宽度为5
        )),
        // errorText: "errorText",
        hintText: Strings.SUPPLEMENTARY_NOTES_HINTS,
      ),
    );
  }

  Widget showAppealType() {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8),
      alignment: FractionalOffset.centerLeft,
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8),
            child:
                TextView.getTextView(Strings.APPEAL_TYPE, Dimens.FONT_SIZE_16),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              child: showSimpleDialog(),
            ),
          ),
        ],
      ),
    );
  }

  Widget showSimpleDialog() {
    Widget materialButton = MaterialButton(
      child: Container(
        alignment: FractionalOffset.centerLeft,
        child: TextView.getTextColorView(
            simpleDialogStr, Colors.black, Dimens.FONT_SIZE_16),
      ),
      onPressed: () {
        _simpleDialogFuture();
      },
    );
    return materialButton;
  }

  Future _simpleDialogFuture() async {
    final result = showDialog(
        context: context,
        builder: (context) {
          return createSimpleDialog();
        });
    result.then((var result) {
      setState(() {
        if (null == result || result.isEmpty) {
          return;
        }
        simpleDialogStr = result;
      });
    });
  }

  Widget createSimpleDialog() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            return;
          },
        ),
        SimpleDialog(
          title: TextView.getTextView(Strings.APP_CHOOSE, Dimens.FONT_SIZE_18),
          children: <Widget>[
            SimpleDialogOption(
              child: TextView.getTextView(appealType[0], Dimens.FONT_SIZE_16),
              onPressed: () {
                Navigator.of(context).pop(appealType[0]);
              },
            ),
            SimpleDialogOption(
              child: TextView.getTextView(appealType[1], Dimens.FONT_SIZE_16),
              onPressed: () {
                Navigator.of(context).pop(appealType[1]);
              },
            ),
            SimpleDialogOption(
              child: TextView.getTextView(appealType[2], Dimens.FONT_SIZE_16),
              onPressed: () {
                Navigator.of(context).pop(appealType[2]);
              },
            ),
          ],
        ),
      ],
    );
  }
}
