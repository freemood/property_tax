import 'package:flutter/material.dart';
import 'package:property_tax/activity/appeal_view.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/entity/property_bean.dart';

class PropertyDetailsView extends StatefulWidget {
  final PropertyBean propertyBean;

  PropertyDetailsView({Key key, @required this.propertyBean}) : super(key: key);

  @override
  _PropertyDetailsViewState createState() =>
      _PropertyDetailsViewState(propertyBean);
}

class _PropertyDetailsViewState extends State<PropertyDetailsView> {
  PropertyBean bean;

  _PropertyDetailsViewState(PropertyBean propertyBean) {
    bean = propertyBean;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text(Strings.PROPERTY_DETAILED),
              centerTitle: true,
              actions: <Widget>[
                Container(
                    padding: const EdgeInsets.only(right: 16),
                    alignment: FractionalOffset.center,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => AppealView(
                                        id: "",
                                      )));
                        },
                        child: Text(
                          Strings.APPEAL_STR,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ))),
              ],
            ),
            body: Column(
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
                          buildProperty("证件类型：", bean.zjType),
                          buildProperty("证件号码：", bean.zjNumber),
                          buildProperty("户主姓名：", bean.name),
                          buildProperty("房产税值：", bean.propertyValue),
                          buildProperty("房产单价：", bean.housePrice),
                          buildProperty("小区均价：", bean.commnuityPrice),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }

  Widget buildProperty(String type, String value) {
    return Container(
        alignment: FractionalOffset.centerLeft,
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                alignment: FractionalOffset.center,
                padding: const EdgeInsets.only(top: 8),
                child: Divider(
                  height: 1.0,
                  color: Color(0xFFF5F5F5),
                )),
          ],
        ));
  }
}
