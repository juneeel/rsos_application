import 'package:flutter/material.dart';
import 'package:rsos_application/LogReg/Login.dart';
import 'package:rsos_application/components/constant.dart';
import "package:package_info/package_info.dart";

class ForgetConfirm extends StatefulWidget {
  @override
  _ForgetConfirmState createState() => _ForgetConfirmState();
}

class _ForgetConfirmState extends State<ForgetConfirm> {
  late String email, password;
  Widget _buildLogo() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Image.asset('assets/img/IconNoBackground.png', height: 200,width: 200,),
          ),
        ]
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: BG,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildconfirmPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: BG,
          ),
          labelText: 'Confirm Password',
        ),
      ),
    );
  }


  Widget _buildContinueButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height: 1.4 * (MediaQuery.of(context).size.height / 20),
            width: 5 * (MediaQuery.of(context).size.width / 10),
            margin: EdgeInsets.only(bottom: 5),
            child: RaisedButton(
              elevation: 5.0,
              color: BG,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 40,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildPasswordRow(),
                _buildconfirmPasswordRow(),
                _buildContinueButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
                _buildContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}