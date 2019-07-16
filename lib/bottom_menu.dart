import 'package:flutter/material.dart';
import 'package:property_tax/activity/home_view.dart';
import 'package:property_tax/activity/personal_view.dart';
import 'package:property_tax/activity/property_view.dart';
import 'package:property_tax/activity/query_view.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/view/text_view.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  List<Widget> listViews = [
    HomeView(),
    PropertyView(),
    QueryView(),
    PersonalView()
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: listViews[_index],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _index == 0 ? Colors.blue : Colors.grey,
                size: 24,
              ),
              title: TextView.getTextColorView(Strings.HOME_BOTTOM_STR,
                  _index == 0 ? Colors.blue : Colors.grey, Dimens.FONT_SIZE_16),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.broken_image,
                color: _index == 1 ? Colors.blue : Colors.grey,
                size: 24,
              ),
              title: TextView.getTextColorView(Strings.PROPERTY_BOTTOM_STR,
                  _index == 1 ? Colors.blue : Colors.grey, Dimens.FONT_SIZE_16),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                color: _index == 2 ? Colors.blue : Colors.grey,
                size: 24,
              ),
              title: TextView.getTextColorView(Strings.FEEDBACK_BOTTOM_STR,
                  _index == 2 ? Colors.blue : Colors.grey, Dimens.FONT_SIZE_16),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                color: _index == 3 ? Colors.blue : Colors.grey,
                size: 24,
              ),
              title: TextView.getTextColorView(Strings.PERSONAL_BOTTOM_STR,
                  _index == 3 ? Colors.blue : Colors.grey, Dimens.FONT_SIZE_16),
            ),
          ],
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
    );
  }
}
