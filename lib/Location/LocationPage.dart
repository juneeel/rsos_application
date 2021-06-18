import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart' as latlng;

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:FlutterMap(
      options: MapOptions(
        center: latlng.LatLng(14.5995, 120.9842),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/juuneeel/ckphy53dj1f7117qws0fnrqdy/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianV1bmVlZWwiLCJhIjoiY2twaHBlZzdrMGk0MDJvcGVhcHhxYzNuYSJ9.cH6xwcpN1AXmpMqTsuZrHA",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoianV1bmVlZWwiLCJhIjoiY2twaHBlZzdrMGk0MDJvcGVhcHhxYzNuYSJ9.cH6xwcpN1AXmpMqTsuZrHA',
              'id': 'mapbox.mapbox-streets-v8'
            }
        ),
        // MarkerLayerOptions(
        //   markers: [
        //     Marker(
        //       width: 80.0,
        //       height: 80.0,
        //       point: latlng.LatLng(14.5995, 120.9842),
        //       builder: (ctx) =>
        //           Container(
        //             child: FlutterLogo(),
        //           ),
        //     ),
        //   ],
        // ),
      ],
    ),
    );
  }
}
