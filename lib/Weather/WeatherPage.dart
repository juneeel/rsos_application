import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import "package:package_info/package_info.dart";

class WeatherHome extends StatefulWidget {

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

@override
class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Color(0xff14213d),
      body: Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  TextEditingController cityGrabber = new TextEditingController();
  var mainTemp;
  var city;
  // API Fetch Logic
  Future<void> getWeather() async {
    final String searchQuery = cityGrabber.text;
    final String appId = "bf383bca10821158964b9d9f2caa6212";
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$searchQuery&appid=$appId&units=metric'));
    var data = json.decode(response.body);
    if (response.statusCode == 404) {
      cityNotFoundError(context);
    }
    if (searchQuery.isEmpty) {
      blankFieldError(context);
    }

    setState(() {
      mainTemp = data['main']['temp'];
      city = data['name'];
    });
  }

// Detecting network state.
  detectConnection(connection) async {
    connection = await (Connectivity().checkConnectivity());
    // Checking connection status for Mobile Data & Wifi
    if (connection != ConnectivityResult.mobile &&
        connection != ConnectivityResult.wifi) {
      noNetworkError(context);
    } else {
      getWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/img/IconNoBackground.png", height: 200,width: 200,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Weather report",
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 330,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 1,
                    )
                  ]),
              width: 340,
              child: TextField(
                controller: cityGrabber,
                onSubmitted: (callback) => {
                  detectConnection(context),
                },
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Color(0x86ffb238),
                    labelText: 'Enter city',
                    labelStyle: TextStyle(
                        color: Colors.white,

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none)),
                obscureText: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 10),
            child: city == null
                ? Text(
                    "Type the location to see the Weather Report",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                : Text(
                    "Weather in $city",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, bottom: 10),
            child: mainTemp == null
                ? Text(
                    "",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                : Text(
                    "$mainTemp" "°C",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
          ),

        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

cityNotFoundError(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 260,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "City Not Found!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Check the spelling or try a different city.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      });
}

blankFieldError(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 170,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Please enter a city name!",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      });
}

noNetworkError(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 170,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "No Network Conect!",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      });
}
