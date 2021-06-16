import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rsos_application/Location/Destination/Destination.dart';
import 'package:rsos_application/Location/GasNearby/GasNearby.dart';
import 'package:rsos_application/Location/LocationPage.dart';
import 'package:rsos_application/News/NewsPage.dart';
import 'package:rsos_application/Report/ReportPage.dart';
import 'package:rsos_application/SafetyTips/SafetyTips.dart';
import 'package:rsos_application/Weather/WeatherPage.dart';
import 'package:rsos_application/components/HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rsos_application/components/constant.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Start(),
    NewsPage(),
    WeatherHome(),
    SafetyTips(),
    LocationPage(),
    ReportPage(),
    // GasNearby(),
    Destination(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = NewsPage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,backgroundColor: Color(0xff14213d),
      actions: [
        IconButton(
              onPressed: () {
                  signOut();
              },
              icon: Icon(Icons.logout_outlined
              ,color: white,),
            )
      ],),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TC,
        child: Icon(FontAwesomeIcons.exclamationCircle,
            color: currentTab == 4 ? Color(0xffffb238) :  Color(0xffffc730),),
        onPressed: () {
          setState(() {
            currentScreen =
                ReportPage(); // if user taps on this dashboard tab will be active
            currentTab = 4;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            NewsPage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.newspaper,
                          color: currentTab == 0 ? Color(0xffffb238) :  Color(0xff14213d),
                        ),
                        Text(
                          'News',
                          style: TextStyle(
                            color: currentTab == 0 ? Color(0xffffb238) :  Color(0xff14213d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            WeatherHome(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.cloudSunRain,
                          color: currentTab == 1 ? Color(0xffffb238) :  Color(0xff14213d),
                        ),
                        Text(
                          'Weather',
                          style: TextStyle(
                            color: currentTab == 1 ? Color(0xffffb238) :  Color(0xff14213d),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            SafetyTips(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.hardHat,
                          color: currentTab == 2 ? Color(0xffffb238) :  Color(0xff14213d),
                        ),
                        Text(
                          'Safety Tips',
                          style: TextStyle(
                            color: currentTab == 2 ? Color(0xffffb238) :  Color(0xff14213d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            LocationPage(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkedAlt,
                          color: currentTab == 3 ? Color(0xffffb238) :  Color(0xff14213d),
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                            color: currentTab == 3 ? Color(0xffffb238) :  Color(0xff14213d),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}