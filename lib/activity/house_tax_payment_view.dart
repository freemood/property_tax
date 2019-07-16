import 'package:flutter/material.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/view/text_view.dart';

class HouseTaxPaymentView extends StatefulWidget {
  HouseTaxPaymentView({Key key}) : super(key: key);

  @override
  _HouseTaxPaymentViewState createState() => _HouseTaxPaymentViewState();
}

class _HouseTaxPaymentViewState extends State<HouseTaxPaymentView> {
  var propertyTax = '1500';
  var propertyTaxTime = '2019-09-01至2019-12-30';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('房产税缴纳'),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
            child: showColumnView(),
          )),
    );
  }

  Widget showColumnView() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blue.shade200,
            elevation: 5.0,
            child: Container(
                padding: const EdgeInsets.only(
                    left: 16, top: 8, bottom: 8, right: 16),
                alignment: FractionalOffset.centerLeft,
                child: Column(
                  children: <Widget>[
                    showRowView('房产税款：', propertyTax),
                    TextView.drawDivider(),
                    showRowView('纳税时间：', propertyTaxTime),
                    TextView.drawDivider(),
                    paymentMethod(),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  Widget showRowView(String title, String content) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 16),
              child: TextView.getTextColorView(
                  title, Colors.black, Dimens.FONT_SIZE_16)),
          Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              TextView.getTextColorView(
                  content, Colors.black, Dimens.FONT_SIZE_16),
            ],
          ),
        ],
      ),
    );
  }

  Widget paymentMethod() {
    AssetImage zhifubaoImage = new AssetImage('images/zhifubao.jpg');
    AssetImage weixinImage = new AssetImage('images/weixin.jpg');
    AssetImage yinlianImage = new AssetImage('images/yinlian.jpg');
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 16,
        //主轴上子控件的间距
        runSpacing: 5,
        //交叉轴上子控件之间的间距
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Container(
              child: TextView.getTextColorView(
                  '支付渠道：', Colors.black, Dimens.FONT_SIZE_16)),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: showImage('支付宝', zhifubaoImage),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: showImage('微信支付', weixinImage),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: showImage('银联支付', yinlianImage),
          )
        ],
      ),
    );
  }

  Widget showImage(String title, ImageProvider imageProvider) {
    return Column(
      children: <Widget>[
        Image(
          image: imageProvider,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: TextView.getTextColorView(
              title, Colors.black, Dimens.FONT_SIZE_13),
        ),
      ],
    );
  }
}
