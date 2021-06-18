import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MHS extends StatefulWidget {
  @override
  _MHSState createState() => _MHSState();
}

class _MHSState extends State<MHS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,backgroundColor: Color(0xff14213d),),
      body: WebView(
        initialUrl: "https://rsos-app.herokuapp.com/handguide",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}