import 'package:flutter/material.dart';
import 'package:rsos_application/components/constant.dart';
import 'package:sms/sms.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();

}

String url= 'tel:911';
Future<void> callnow() async{
  if(await canLaunch(url))
  {
    await launch(url);
  }else
  {
    throw 'call not possible';
  }
}

   Future<Null> sendSms() async {
     SmsSender smsSender = new SmsSender();
     smsSender.sendSms(new SmsMessage('09218496886', 'HELP HELP'));
   }

Widget _buildLogo() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Image.asset('assets/img/IconNoBackground.png', height:300,width: 300,),
        ),
      ]
  );
}

Widget _buildLevel1Button(BuildContext context) {
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
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: GC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            sendSms();
          },
          child: Text(
            "Severe Level 1",
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

Widget _buildLevel2Button(BuildContext context) {
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
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: FC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            sendSms();
          },
          child: Text(
            "Severe level 2",
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

Widget _buildLevel3Button(BuildContext context) {
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
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: LC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            callnow();
            sendSms();
          },
          child: Text(
            "Severe Level 3",
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

Widget _buildLevel4Button(BuildContext context) {
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
        margin: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          elevation: 5.0,
          color: TC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            callnow();
            sendSms();
          },
          child: Text(
            "Severe Level 4",
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

class _ReportPageState extends State<ReportPage> {
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
                _buildLevel1Button(context),
                _buildLevel2Button(context),
                _buildLevel3Button(context),
                _buildLevel4Button(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
