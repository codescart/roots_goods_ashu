import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:roots_goods/constant/Constat_file.dart';
import 'dart:ui' as ui;
import 'package:roots_goods/farmer/boxes.dart';

class LiveLocation extends StatefulWidget {
  final byertransection loc;

  LiveLocation({required this.loc});

  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  String? _mapStyle;

  // late LatLng destination;
  late LatLng farmerlocation;
  late LatLng buyerlocation;
  // late LatLng source;
  final Set<Polyline> _polyline = {};

  Set<Marker> markers = Set<Marker>();
  List<String> list = <String>[
    '***** ***** ***** 1138',
    '***** ***** ***** 8601',
    '***** ***** ***** 1695',
    '***** ***** ***** 7179',
  ];

  @override
  void initState() {

    super.initState();
    final finalformerlet=double.parse("${widget.loc.farmerlat}");
    final finalformerlang=double.parse('${widget.loc.farmerlong}');
    final finalbuyerlet=double.parse('${widget.loc.buyerlat}');
    final finalbuyerlang=double.parse('${widget.loc.buyerlong}');
    farmerlocation = LatLng(finalformerlet, finalformerlang);
    buyerlocation = LatLng(finalbuyerlet, finalbuyerlang);
    markers.add(Marker(
      markerId: const MarkerId('Farmer Location'),
      infoWindow: InfoWindow(
        title: 'Farmer Location',
      ),
      position: farmerlocation,
      icon: BitmapDescriptor.defaultMarker,
    ));
    markers.add(Marker(

      markerId: const MarkerId('Buyer Location'),
      infoWindow: InfoWindow(
        title: 'Buyer Location',
      //  : "",
      ),

      position: buyerlocation,
      icon: BitmapDescriptor.defaultMarker
    ));
    // authController.getUserInfo();

    drawPolyline();
    camera_position();



  }
  camera_position() async {
    final GoogleMapController controller = await myMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: buyerlocation, zoom: 7.5)));

  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer
        .asUint8List();
  }

  Future<Uint8List?>loadNetWorkImage(String path) async{
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener((info,_) =>completer.complete(info))
    );
    final imageInfo = await completer.future;
    final byteData = await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  String dropdownValue = '***** ***** ***** 8601';
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 7.5,
  );

  // GoogleMapController? myMapController;
  Completer<GoogleMapController> myMapController = Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title:  Text(
          "Live Location",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20.r,
              right: 20.r,
            ),
            child: Container(
              height: 250.h,
              width: 700.w,
              child: Card(
                elevation: 7.r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15.r,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 25.r,
                      bottom: 25.r,
                    ),
                    child: Stack(
                      children: [
                        GoogleMap(
                          markers: markers,
                          polylines: _polyline,
                          mapType: MapType.normal,
                          zoomControlsEnabled: false,
                          onMapCreated: (GoogleMapController controller) {
                            myMapController.complete(controller);
                          },
                          // onMapCreated: (GoogleMapController controlleree) {
                          //   myMapController = controlleree;
                          //   myMapController.setMapStyle(_mapStyle);
                          // },
                          initialCameraPosition: _kGooglePlex,
                        ),
                        buildCurrentLocationIcon(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static const kGoogleApiKey = Apiconst.mapkey;

  Future<LatLng> buildLatLngFromAddress(String place) async {
    List<geoCoding.Location> locations =
        await geoCoding.locationFromAddress(place);
    return LatLng(locations.first.latitude, locations.first.longitude);
  }

  Widget buildCurrentLocationIcon() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


  late Uint8List markIcons;

  loadCustomMarker() async {
    markIcons = await loadAsset('assets/address.png', 100);
  }

  Future<Uint8List> loadAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void drawPolyline() async {
    var polyline = await _getPolyLine();
    _polyline.add(polyline);
    setState(() {});
  }

  Future<Polyline> _getPolyLine() async {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      color: Colors.green,
      width: 3,
      polylineId: id,
      points: await _getPolylineCoordinates(farmerlocation, buyerlocation),
    );

    return polyline;
  }

  Future<List<LatLng>> _getPolylineCoordinates(
      LatLng pickupLatLng, LatLng dropLatLng) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(pickupLatLng.latitude, pickupLatLng.longitude),
      PointLatLng(dropLatLng.latitude, dropLatLng.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    print(polylineCoordinates);
    return polylineCoordinates;
  }

  int selectedRide = 0;
}
