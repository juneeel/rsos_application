import 'package:flutter/material.dart';
import 'package:rsos_application/components/constant.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

Widget _buildLogo() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Image.asset('assets/img/IconNoBackground.png', height:150,width: 150,),
        ),
      ]
  );
}

class _DestinationState extends State<Destination> {
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
