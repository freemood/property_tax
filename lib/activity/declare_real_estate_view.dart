import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/view/text_view.dart';

class DeclareRealEstateView extends StatefulWidget {
  DeclareRealEstateView({Key key}) : super(key: key);

  @override
  _DeclareRealEstateViewState createState() => _DeclareRealEstateViewState();
}

class _DeclareRealEstateViewState extends State<DeclareRealEstateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView.getTextColorView(
            '申报房产信息', Colors.white, Dimens.FONT_SIZE_20),
        centerTitle: true,
      ),
      body: Scrollbar(
          child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
        ),
        child: Column(
          children: <Widget>[
            showProgressView(),
            showBaseInfoView('基本信息'),
            TextView.drawDivider(),
            showAppealExplain('身份证号', '请输入身份证号',
                WhitelistingTextInputFormatter.digitsOnly), //只允许输入数字
            TextView.drawDivider(),
            showAppealExplain('本人姓名', '请输入姓名',
                WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))),

            showBaseInfoView('配偶信息'),
            TextView.drawDivider(),
            showAppealExplain('配偶证号', '请输入配偶身份证号',
                WhitelistingTextInputFormatter.digitsOnly), //只允许输入数字
            TextView.drawDivider(),
            showAppealExplain('配偶姓名', '请输入配偶姓名',
                WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))),
            showBottom('下一步'),
          ],
        ),
      )),
    );
  }

  Widget showBottom(String name) {
    return Offstage(
      offstage: false,
      child: Padding(
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
                  onPressed: () {
                    _nextView();
                  },
                ),
              ),
            ],
          )),
    );
  }

  Future _nextView() async {}

  Widget showProgressView() {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.adjust,
            color: Colors.blue,
          ),
          Icon(
            Icons.linear_scale,
            color: Colors.grey,
            size: 32,
          ),
          Icon(
            Icons.adjust,
            color: Colors.grey,
          ),
          Icon(
            Icons.linear_scale,
            color: Colors.grey,
            size: 32,
          ),
          Icon(
            Icons.adjust,
            color: Colors.grey,
          ),
          Icon(
            Icons.linear_scale,
            color: Colors.grey,
            size: 32,
          ),
          Icon(
            Icons.adjust,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget showBaseInfoView(String title) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          color: Colors.white,
          alignment: FractionalOffset.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bookmark,
                color: Colors.blue,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextView.getTextColorView(
                    title, Colors.black, Dimens.FONT_SIZE_16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget showAppealExplain(
      String title, String hitTitle, WhitelistingTextInputFormatter type) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: TextView.getTextColorView(
                title, Colors.black, Dimens.FONT_SIZE_16),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 8),
            child: showTextField(hitTitle, type),
          )),
        ],
      ),
    );
  }

  Widget showTextField(String hitTitle, WhitelistingTextInputFormatter type) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [type],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white, //边线颜色为黄色
            width: 1, //边线宽度为2
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white, //边框颜色为绿色
          width: 3, //宽度为5
        )),
        contentPadding: EdgeInsets.all(10.0),
        hintText: hitTitle,
      ),
      autofocus: false,
    );
  }
}
