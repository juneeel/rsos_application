import 'package:flutter/material.dart';
import 'package:rsos_application/Location/Destination/Destination.dart';
import 'package:rsos_application/Location/GasNearby/GasNearby.dart';
import 'package:rsos_application/SafetyTips/FirstAid/FisrtAid.dart';
import 'package:rsos_application/SafetyTips/MHS/MHS.dart';
import 'package:rsos_application/SafetyTips/MST/MST.dart';
import 'package:rsos_application/components/constant.dart';

class SafetyTips extends StatefulWidget {
  @override
  _SafetyTipsState createState() => _SafetyTipsState();
}

Widget _buildLogo() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset('assets/img/IconNoBackground.png', height:300,width: 300,),
        ),
      ]
  );
}

Widget _buildFirstAidButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 1.4 * (MediaQuery
            .of(context)
            .size
            .height / 20),
        width: 5 * (MediaQuery
            .of(context)
            .size
            .width / 5.5),
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: TC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstAid()));
          },
          child: Text(
            "First Aid",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .height / 40,
            ),
          ),
        ),
      )
    ],
  );
}

Widget _buildRoadButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 1.4 * (MediaQuery
            .of(context)
            .size
            .height / 20),
        width: 5 * (MediaQuery
            .of(context)
            .size
            .width / 5.5),
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: FC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MHS()));
          },
          child: Text(
            "Motorcycle Hand Signs",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .height / 40,
            ),
          ),
        ),
      )
    ],
  );
}

Widget _buildEtiquettesButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 1.4 * (MediaQuery
            .of(context)
            .size
            .height / 20),
        width: 5 * (MediaQuery
            .of(context)
            .size
            .width / 5.5),
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: LC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MST()));
          },
          child: Text(
            "Motorcycle Safety Techniques",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .height / 40,
            ),
          ),
        ),
      )
    ],
  );
}

class _SafetyTipsState extends State<SafetyTips> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: BG,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                _buildLogo(),
                _buildFirstAidButton(context),
                _buildRoadButton(context),
                _buildEtiquettesButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
