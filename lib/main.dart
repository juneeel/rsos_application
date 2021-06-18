import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rsos_application/LogReg/Login.dart';
import 'package:rsos_application/components/MainMenu.dart';
import 'LogReg/Register.dart';
import 'components/HomePage.dart';
import "package:package_info/package_info.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          primaryColor: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home:

      BottomNav(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
      },

    );
  }

}
