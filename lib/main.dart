import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:property_tax/base/strings.dart';

import 'bottom_menu.dart';

void main() {
  //强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_TITLE,
      theme: ThemeData.light(),
      home: BottomMenu(),
      routes: {
//        "dialogRoute": (BuildContext context) => showSimpleDialog(),
      },
    );
  }
}
