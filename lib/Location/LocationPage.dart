import 'package:flutter/material.dart';
import 'package:rsos_application/Location/Destination.dart';
import 'package:rsos_application/Location/GasNearby.dart';
import 'package:rsos_application/components/constant.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
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

Widget _buildGasNearbyButton(BuildContext context) {
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
              .width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: SC,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GasNearby()));
            },
            child: Text(
              "Gas Nearby",
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


Widget _buildDestinationButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 1.4 * (MediaQuery.of(context).size.height / 20),
        width: 5 * (MediaQuery.of(context).size.width / 10),
        margin: EdgeInsets.only(bottom: 5),
        child: RaisedButton(
          elevation: 5.0,
          color: TC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Destination()));
          },
          child: Text(
            "Destination",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: MediaQuery.of(context).size.height / 40,
            ),
          ),
        ),
      )
    ],
  );
}

class _LocationPageState extends State<LocationPage> {
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
                _buildGasNearbyButton(context),
                _buildDestinationButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
