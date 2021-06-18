import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "package:package_info/package_info.dart";

class MST extends StatefulWidget {
  @override
  _MSTState createState() => _MSTState();
}

class _MSTState extends State<MST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,backgroundColor: Color(0xff14213d),),
      body: WebView(
        initialUrl: "https://rsos-app.herokuapp.com/techniques",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}