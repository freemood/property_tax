import 'package:flutter/material.dart';
import 'package:property_tax/activity/login_view.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/utils/event_bus.dart';
import 'package:property_tax/view/combination_view.dart';
import 'package:property_tax/view/text_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalView extends StatefulWidget {
  @override
  _PersonalViewState createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  String result = "loginOk";
  var personalName = "张三";
  bool isHide = false;
  List<String> strItems = <String>[
    Strings.PERSONAL_INFORMATION,
    Strings.FAMILY_PERSONNEL,
    Strings.E_MAIL,
    Strings.MAKE_TIME,
    Strings.SAFETY_CENTER,
    Strings.SETTING,
    Strings.ABOUT,
    Strings.SIGN_OUT,
  ];

  List<Icon> iconItems = <Icon>[
    Icon(
      Icons.keyboard,
      color: Colors.blue,
    ),
    Icon(
      Icons.print,
      color: Colors.blue,
    ),
    Icon(
      Icons.router,
      color: Colors.blue,
    ),
    Icon(
      Icons.pages,
      color: Colors.blue,
    ),
    Icon(
      Icons.zoom_out_map,
      color: Colors.blue,
    ),
    Icon(
      Icons.zoom_out,
      color: Colors.blue,
    ),
    Icon(
      Icons.youtube_searched_for,
      color: Colors.blue,
    ),
    Icon(
      Icons.wifi_tethering,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
      ),
      child: Scrollbar(
        child: showPersonalView(),
      ),
    );
  }

  @override
  void initState() {
    ///初始化
    super.initState();
    EventBus.getDefault().register((String result) {
      if (null != result) {
        _readShared("name");
      }
    });
  }

  Future _readShared(var atter) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String vaule = preferences.get(atter);
    setState(() {
      personalName = vaule;
      isHide = true;
    });
    return vaule;
  }

  Widget showPersonalView() {
    return Column(
      children: <Widget>[
        showUserIcon(),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CombinationView.showItmeView(Icons.person, strItems[0]),
        ),
        TextView.drawDivider(),
        CombinationView.showItmeView(Icons.people, strItems[1]),
        TextView.drawDivider(),
        CombinationView.showItmeView(Icons.email, strItems[2]),
        TextView.drawDivider(),
        CombinationView.showItmeView(Icons.slow_motion_video, strItems[3]),
        TextView.drawDivider(),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CombinationView.showItmeView(Icons.security, strItems[4]),
        ),
        TextView.drawDivider(),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CombinationView.showItmeView(Icons.settings, strItems[5]),
        ),
        TextView.drawDivider(),
        CombinationView.showItmeView(Icons.assignment, strItems[6]),
        showBottom(Strings.LOGIN_OUT),
      ],
    );
  }

  Widget showBottom(String name) {
    return Offstage(
      offstage: isHide,
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
                    _loginOut();
                  },
                ),
              ),
            ],
          )),
    );
  }

  Future _loginOut() async {
    showDialog(
        context: context,
        builder: (context) {
          return showAlertDialog();
        }).then((var result) {
      if (result.isEmpty) {
        return;
      }
      setState(() {
        personalName = Strings.LOGIN_REGISTRATION;
        isHide = true;
      });
    });
  }

  Widget showAlertDialog() {
    return AlertDialog(
      title: TextView.getTextColorView(
          Strings.SIGN_OUT, Colors.black, Dimens.FONT_SIZE_18),
      content: TextView.getTextColorView(
          Strings.IS_LOGIN_OUT_CONTENT, Colors.black, Dimens.FONT_SIZE_16),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop("yes");
          },
          child: TextView.getTextColorView(
              Strings.BTN_OK, Colors.black, Dimens.FONT_SIZE_16),
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop("");
            },
            child: TextView.getTextColorView(
                Strings.BTN_CANCEL, Colors.black, Dimens.FONT_SIZE_16))
      ],
    );
  }

  Widget showUserIcon() {
    return GestureDetector(
      child: Container(
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 60, left: 32, bottom: 16),
              child: Icon(
                Icons.account_circle,
                size: 64,
                color: Colors.white70,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50, left: 16),
              child: TextView.getTextColorView(
                  personalName, Colors.white, Dimens.FONT_SIZE_16),
            ),
          ],
        ),
      ),
      onTap: () {
        if (!isHide) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      },
    );
  }
}
