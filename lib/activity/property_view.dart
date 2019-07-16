import 'package:flutter/material.dart';
import 'package:property_tax/activity/property_details_view.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/bean/property_bean.dart';
import 'package:property_tax/view/text_view.dart';

class PropertyView extends StatefulWidget {
  @override
  _PropertyViewState createState() => _PropertyViewState();
}

class _PropertyViewState extends State<PropertyView> {
  List<PropertyBean> _bean = [];

  @override
  void initState() {
    super.initState();
    var pbean = new PropertyBean();
    pbean.name = "张三";
    pbean.commnuityPrice = "145000";
    pbean.housePrice = "150000";
    pbean.id = "1";
    pbean.propertyValue = "2000";
    pbean.zjType = "不动产权证";
    pbean.zjNumber = "21G4MJ45FA32HJH4HJH";
    _bean.add(pbean);

    var pbean2 = new PropertyBean();
    pbean2.name = "lili";
    pbean2.commnuityPrice = "130";
    pbean2.housePrice = "100";
    pbean2.id = "2";
    pbean2.propertyValue = "10";
    pbean2.zjType = "房产所有权证";
    pbean2.zjNumber = "21G4MJ45FA32HJH4HJH";
    _bean.add(pbean2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.PROPERTY_BOTTOM_STR),
          centerTitle: true,
        ),
        body: showlistView(),
      ),
    );
  }

  Widget showlistView() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
        ),
        child: ListView.builder(
          itemCount: _bean.length,
          itemBuilder: buildItem,
        ));
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PropertyDetailsView(propertyBean: _bean[index]),
            ),
          );
        },
        child: Container(
            padding:
                const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
            child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blue.shade200,
                color: Colors.white,
                elevation: 5.0,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, top: 8, bottom: 8, right: 16),
                  alignment: FractionalOffset.centerLeft,
                  child: Column(
                    children: <Widget>[
                      buildProperty("证件类型：", '${_bean[index].zjType}'),
                      buildProperty("证件号码：", '${_bean[index].zjNumber}'),
                      buildProperty("户主姓名：", '${_bean[index].name}'),
                      buildProperty("房产税值：", '${_bean[index].propertyValue}'),
                      buildProperty("房产单价：", '${_bean[index].housePrice}'),
                      buildProperty("小区均价：", '${_bean[index].commnuityPrice}'),
                    ],
                  ),
                ))));
  }

  Widget buildProperty(String type, String value) {
    return Column(
      children: <Widget>[
        Container(
            alignment: FractionalOffset.centerLeft,
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Row(
              children: <Widget>[
                TextView.getTextView(type, 16.0),
                TextView.getTextViewPading16(value, 16.0),
              ],
            )),
        TextView.drawDivider8(),
      ],
    );
  }
}
