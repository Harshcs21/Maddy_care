import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:dio/dio.dart'; // For API calls

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController mapController;
  Location location = Location();
  LatLng? _currentLocation;
  final LatLng _destination = LatLng(12.9352, 77.6245); // Example: Doctor's Clinic

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  /// Fetches the user's current location
  Future<void> _getUserLocation() async {
    var currentLocation = await location.getLocation();
    setState(() {
      _currentLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      _markers.add(Marker(
        markerId: MarkerId('current_location'),
        position: _currentLocation!,
        infoWindow: InfoWindow(title: 'Your Location'),
      ));
      _markers.add(Marker(
        markerId: MarkerId('destination'),
        position: _destination,
        infoWindow: InfoWindow(title: 'Doctor\'s Clinic'),
      ));
    });

    _fetchRoute();
  }

  /// Fetches route from Google Maps Directions API
  Future<void> _fetchRoute() async {
    if (_currentLocation == null) return;

    const String apiKey = "AIzaSyDFn04viVIIqtQAa9-2jQsi9xo6SOT3unU"; // Replace with your API Key
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${_currentLocation!.latitude},${_currentLocation!.longitude}&destination=${_destination.latitude},${_destination.longitude}&key=$apiKey";

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<LatLng> polylineCoordinates = _decodePolyline(response.data['routes'][0]['overview_polyline']['points']);
        setState(() {
          _polylines.add(Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            width: 5,
            points: polylineCoordinates,
          ));
        });
      }
    } catch (e) {
      print("Error fetching route: $e");
    }
  }

  /// Decodes Google Maps Polyline into LatLng list
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Location')),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentLocation!,
          zoom: 14.0,
        ),
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}