import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "package:package_info/package_info.dart";

class FirstAid extends StatefulWidget {
  @override
  _FirstAidState createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,backgroundColor: Color(0xff14213d),),
      body: WebView(
        initialUrl: "https://rsos-app.herokuapp.com/firstaid",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}