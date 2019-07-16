import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final String url;

  WebView({Key key, @required this.url}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState(url);
}

class _WebViewState extends State<WebView> {
  var urlString = "";

  _WebViewState(String url) {
    urlString = url;
  }

  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: controller,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Url Here",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => launchUrl(),
          )
        ],
      ),
      url: urlString,
      withZoom: false,
    );
  }
}
