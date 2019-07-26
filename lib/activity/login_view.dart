import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/entity/user_entity.dart';
import 'package:property_tax/http/api.dart';
import 'package:property_tax/http/http_request.dart';
import 'package:property_tax/utils/event_bus.dart';
import 'package:property_tax/view/text_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _parsswordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('房产税申报服务平台'),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
            child: showLoginView(),
          )),
    );
  }

  Widget showLoginView() {
    return Column(
      children: <Widget>[
        showUserIcon(),
        showLoginText(),
        showPassWord(),
        showForgetPassword(),
        showBottom('登录'),
        showBottomPassword('注册'),
      ],
    );
  }

  Widget showForgetPassword() {
    return Container(
      alignment: FractionalOffset.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16),
        child:
            TextView.getTextColorView('忘记密码', Colors.blue, Dimens.FONT_SIZE_13),
      ),
    );
  }

  Widget showLoginText() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: TextField(
        controller: _loginController,
        decoration: InputDecoration(
          //icon: Icon(Icons.person),
          hasFloatingPlaceholder: false,
//          labelText: "labelText",
//        helperText: "helperText",
//        errorText: "errorText",
          hintText: "手机号码/证件号码/登录名",
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Colors.blue,
          ),
//            prefixText: "prefixText",
//          suffixIcon: Icon(
//            Icons.remove_red_eye,
//          ),

//        selection: TextSelection.fromPosition(TextPosition(
//                      affinity: TextAffinity.downstream,
//                      offset: inputText.length)))),
//
//suffixText: "suffixText",
        ),
      ),
    );
  }

  Widget showPassWord() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        obscureText: true,
        controller: _parsswordController,
        decoration: InputDecoration(
          //icon: Icon(Icons.person),
          hasFloatingPlaceholder: false,
//        labelText: "labelText",
//        helperText: "helperText",
//        errorText: "errorText",
          hintText: "请输入密码",
          prefixIcon: Icon(
            Icons.no_encryption,
            color: Colors.blue,
          ),
        ),
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(18)
        ],
      ),
    );
  }

  Widget showUserIcon() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        child: Icon(
          Icons.account_circle,
          size: 75,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget showBottom(String name) {
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
                onPressed: () {
                  _login();
                },
              ),
            ),
          ],
        ));
  }

  Widget showBottomPassword(String name) {
    return Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                color: Colors.white,
                highlightColor: Colors.white70,
                colorBrightness: Brightness.dark,
                splashColor: Colors.blue,
                child: TextView.getTextColorView(
                    name, Colors.blue, Dimens.FONT_SIZE_16),
                shape: StadiumBorder(
                    side: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.blue,
                )),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }

  Future _login() async {
    var code = _loginController.text;
    var password = _parsswordController.text;
    final Map<String, dynamic> data = new Map<String, dynamic>();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    data['password'] = password;
    data['code'] = code;
    HttpUtil.post(Api.USER_URL,
        data: {'password': password, 'code': code},
        headers: {}, success: (data) {
      // 请求成功返回的数据
      UserEntity userEntity = UserEntity.fromJson(data);
      if (null != userEntity) {
        preferences.setString("name", userEntity.name);
        preferences.setString("code", userEntity.code);
        preferences.setString("password", userEntity.password);
      }
      EventBus.getDefault().post("loginOk");
      Navigator.of(context).pop();
    }, error: (errorMsg) {
      // 请求失败返回的错误信息
    });
  }

  @override
  void dispose() {
    super.dispose();
    _parsswordController.dispose();
    _loginController.dispose();
  }
}
