import 'dart:io';
import 'dart:typed_data';

import 'package:entregaudium/presentation/theme.dart';
import 'package:entregaudium/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:ui' as ui;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entregaudium',
      theme: appTheme,
      home: const MyHomePage(title: 'Entregaudium'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late GoogleMapController mapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final Map<String, Marker> _markers = {};



  final LatLng _center = const LatLng(-22.904093, -43.175293);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (markerIcon == BitmapDescriptor.defaultMarker) {
      getBytesFromAsset('assets/images/pin_user_white.png', 100).then((value) {
        setState(() {
          markerIcon = BitmapDescriptor.fromBytes(value!);
        });
      });
    } else {
      var marker = Marker(
        markerId: const MarkerId('user'),
        position: const LatLng(-22.904093, -43.175293),
        icon: markerIcon,
      );
      _markers['user'] = marker;
    }


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_outlined,
                  color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        markers: _markers.values.toSet(),
      )
    );
  }


  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }
}

