import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:property_tax/activity/declare_real_estate_view.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/view/text_view.dart';
import 'package:property_tax/webview/web_view.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  List<String> _itmes = [];

  @override
  void initState() {
    super.initState();
    _itmes
      ..add(
          "https://upload-images.jianshu.io/upload_images/5361063-e413832da0038304.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/800")
      ..add("http://s16.sinaimg.cn/orignal/001hH7A7zy7qFwXdjBRff")
      ..add("http://s11.sinaimg.cn/orignal/001hH7A7zy7qFqN1U4aea");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x1F5F5F5),
        appBar: AppBar(
          title: Text(Strings.HOME_BOTTOM_STR),
          centerTitle: true,
        ),
        body: Container(
          //背景色
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Swiper(
                    itemBuilder: _swiperBuilderOne,
                    itemCount: _itmes.length,
                    pagination: new SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                      color: Colors.black54,
                      activeColor: Colors.white,
                    )),
                    control: new SwiperControl(),
                    scrollDirection: Axis.horizontal,
                    autoplay: true,
                    onTap: (index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WebView(url: "http://www.baidu.com"),
                        ),
                      );
                    },
                  )),
              textShenbao,
              rowOne(context),
              rowTwo(context),
            ],
          ),
        ));
  }

  Widget textShenbao = Container(
    padding: const EdgeInsets.only(top: 8, left: 16),
    alignment: FractionalOffset.centerLeft,
    child: TextView.getTextColorView(
        Strings.DECLARE_PROPERTY_WRITE_STR, Colors.black, Dimens.FONT_SIZE_16),
  );

  Widget rowOne(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: GestureDetector(
              child: Offstage(
                offstage: false,
                child: declareView(
                    Colors.white,
                    Icons.account_balance,
                    Strings.DECLARE_PROPERTY_STR,
                    const EdgeInsets.only(top: 16, left: 16, right: 0.5),
                    MainAxisAlignment.center),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DeclareRealEstateView();
                }));
              },
            )),
        Expanded(
            flex: 1,
            child: Offstage(
              offstage: false,
              child: declareView(
                  Colors.white,
                  Icons.library_books,
                  Strings.SUOOLEMENT_PROPERTY_DETAILED,
                  const EdgeInsets.only(top: 16, left: 0.5, right: 16),
                  MainAxisAlignment.center),
            )),
      ],
    );
  }

  Widget rowTwo(BuildContext context) {
    return Flex(
      //位置设置
//      mainAxisAlignment: MainAxisAlignment.start,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Offstage(
              offstage: false,
              child: declareView(
                  Colors.white,
                  Icons.account_balance,
                  Strings.FAMILY_PERSONNEL,
                  const EdgeInsets.only(top: 1, left: 16, right: 0.5),
                  MainAxisAlignment.center),
            )),
        Expanded(
          flex: 1,
          child: Offstage(
            offstage: true,
            child: declareView(
                Colors.white,
                Icons.library_books,
                Strings.MAKE_TIME,
                const EdgeInsets.only(top: 1, left: 0.5, right: 16),
                MainAxisAlignment.center),
          ),
        )
      ],
    );
  }

  Widget declareView(Color color, IconData icon, String label,
      EdgeInsets edgeInsets, MainAxisAlignment mainAxisAlignment) {
    return Container(
        margin: edgeInsets,
        height: 100,
        color: Colors.blue,
        child: Row(
          //居中
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            Container(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 8),
            ),
            Container(
              alignment: FractionalOffset.center,
              margin: const EdgeInsets.only(left: 8),
              child:
                  TextView.getTextColorView(label, color, Dimens.FONT_SIZE_16),
            ),
          ],
        ));
  }

  Widget _swiperBuilderOne(BuildContext context, int index) {
    return (Image.network(
      _itmes[index],
      fit: BoxFit.fill,
    ));
  }

  static BorderSide createBorderSide(BuildContext context,
      {Color color, double width = 0.0}) {
    assert(width != null);
    return BorderSide(
      color: color ?? Theme.of(context).dividerColor,
      width: width,
    );
  }
}
