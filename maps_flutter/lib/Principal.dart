import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  Completer<GoogleMapController> controller = Completer();

  onMapCreated (GoogleMapController googleMapController){
    controller.complete(googleMapController);
  }

  mudarCamera() async{
    GoogleMapController googleMapController = await controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(-23.359424, -51.164660),
        zoom: 18)
      )
    );
  }

  criarMarcadores() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas"),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.satellite,
          initialCameraPosition: CameraPosition(
            target: LatLng(-23.354703, -51.162166),
            zoom: 18
          ) ,
          onMapCreated: onMapCreated,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_circle),
        onPressed: mudarCamera,
        backgroundColor: Colors.red,
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
