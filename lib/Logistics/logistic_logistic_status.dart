import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:roots_goods/Logistics/transcation/transcationlogistics.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';


class logistic_tranction_status extends StatefulWidget {
final loc;
logistic_tranction_status( {required this.loc,});

  @override
  State<logistic_tranction_status> createState() => _logistic_tranction_statusState();
}

class _logistic_tranction_statusState extends State<logistic_tranction_status> {

  bool _loading = false;
  String? logistic;
  List logistic_data = [];
  Future<String> state() async {
    final res = await http
        .get(Uri.parse(Apiconst.logistic_deliverystatus));
    final resBody = json.decode(res.body);
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      logistic_data = resBody['data'];
    });
    return "Sucess";
  }



  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () { Navigator.pop(context); },
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

            ),
            title:  Text(
              "Logistic Status",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 12,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 6,

                    child: Container(
                      height: 150.h,
                      padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Choose your Location', style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.w600, fontSize: 12, ),),
                                    ],
                                  ),
                                  Center(
                                    child: Container(
                                      height:  130.h,
                                      // height: MediaQuery.of(context).size.height * 0.85,
                                      child: _buildBody(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(

                    height: 40,
                    width: MediaQuery.of(context).size.width*0.85,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(
                            0,
                            2,
                          ), //Offset
                          blurRadius: 1,
                          spreadRadius: 1,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(
                            0,
                            0,
                          ),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ), //BoxShadow
                      ],
                    ),
                    child: _draggedAddress==''? InkWell(
                      onTap: (){

                      },
                      child:  Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color:  Color(0xffA1D567),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 15,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        padding:  EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/placeholder1.png"),
                             SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Pick Location from Map',
                              style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),)
                        :InkWell(
                      onTap: (){

                      },
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color:  Color(0xffA1D567),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 15,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        padding:  EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/placeholder1.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                _draggedAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                    fontWeight: FontWeight.normal
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),)
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 25.0,right: 25,top: 8,bottom: 8),
                  child: Container(
                    height: 25.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20.r, right: 20.r),
                    // alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all( color: Colors.black)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text( widget.loc.logisticstatus=='0'?"Logisitics Status : At Source ":
                        widget.loc.logisticstatus=='1'?"Logisitics Status : Loaded":
                        widget.loc.logisticstatus=='2'?"Logisitics Status : On Road":
                        widget.loc.logisticstatus=='3'?"Logisitics Status : Deliverd":
                        "Logisitics Status : Payment Recived",
                          style: GoogleFonts.alike(
                            textStyle:  TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                        ),
                        items: logistic_data.map((item) {
                          return DropdownMenuItem(
                              child:
                              Container(
                                height: 100.h,
                                width: 500.w,
                                child: ListTile(
                                  title:  Center(
                                    child: Text(
                                      item['name'].toString(),
                                      overflow: TextOverflow.clip,
                                      softWrap: false,
                                      style: GoogleFonts.alike(
                                        textStyle:  TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w900
                                        ),
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ),

                              value: item['status'].toString());
                        }).toList(),
                        onChanged: (value) async {
                          setState(() {
                            logistic = value as String;
                          });

                        },
                        value: logistic,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: (){
                    addoffer();
                  },
                  child: Container(
                    width: 600.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffA1D567),
                      border: Border.all(
                        color: const Color(0xffA1D567),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child:
                          _loading == false?
                          Text(
                            "Upload",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold),
                          ): Center(
                            child: Padding(
                              padding:  EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30.r,
                                    width: 30.r,
                                    child: CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(Colors.white)),
                                  ),
                                  Text(
                                    "Please Wait...",
                                    style: GoogleFonts.alike(
                                      textStyle:  TextStyle(
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    state();
    super.initState();
    _init();

  }

  var lat="0.000";
  var long="0.000";
  var latt;
  var longg;
  var pj;
  String apiKey = Apiconst.mapkey;
  String radius = "30";
  double latitude = 31.5111093;
  double longitude = 74.279664;

  Completer<GoogleMapController>  _controller = Completer();
  String _draggedAddress = "";
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  _init() {
    _defaultLatLng = const LatLng(20.5937, 78.9629);
    _draggedLatlng = _defaultLatLng;
    _cameraPosition = CameraPosition(
        target: _defaultLatLng,
        zoom: 10.5
    );
    _gotoUserCurrentPosition();
  }
  Uint8List? marketimages;
  final List<Marker> _markers =[];
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


  var totallen;

  Widget _buildBody() {
    return Stack(
        children : [
          _getMap(),

          _getCustomPin(),

          _getLoctionButton(),
        ]
    );
  }
  Widget _getMap() {
    return GoogleMap(
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: _cameraPosition!,
        mapType: MapType.terrain,
        onCameraIdle: () {
          _getAddress(_draggedLatlng);
        },
        onCameraMove: (cameraPosition) {
          _draggedLatlng = cameraPosition.target;
        },
        onMapCreated: (GoogleMapController controller) {
          if (!_controller.isCompleted) {
            _controller.complete(controller);
          }
        }
    );
  }
  Future _gotoUserCurrentPosition() async {


    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
    final Uint8List locationIcon = await getImages('assets/googleicon.png', 70);
    setState(() async {
      lat = currentPosition.latitude.toString();
      long = currentPosition.longitude.toString();
      var lats = double.parse(lat);
      var longs = double.parse(long);
      _markers.add(
          Marker(
            markerId: MarkerId('0'),

            icon: BitmapDescriptor.fromBytes(locationIcon),
            position: LatLng(lats, longs),
            infoWindow: InfoWindow(
              title: "userName",
            ),
            draggable:true,
            onDragEnd: ((newPosition) {
              print('rrrrrrrrrrrr');
              print(newPosition.latitude);
              print(newPosition.longitude);
            }),
          )
      );
    });

  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: position,
                zoom: 13.5
            )
        )
    );
    await _getAddress(position);
  }
  Future _getAddress(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    Placemark address = placemarks[0];
    String addresStr = "${address.street}, ${address.locality}, ${address
        .administrativeArea}, ${address.country}";
    setState(() {
      latt = position.latitude;
      longg = position.longitude;
      _draggedAddress = addresStr;
    });

  }
  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }
    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    if(locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }


  Widget _getLoctionButton() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: InkWell(
        onTap:  (){
          _gotoUserCurrentPosition();
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),

            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
            ],
          ),
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }

  Widget _getCustomPin() {
    return Positioned(
      top: 100,
      left: 120,
      child: InkWell(
        onTap: () async {

          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: Text(_draggedAddress,),
                content: Container(
                  height: 200,
                  width: 400,
                  child: Column(
                    children: [
                      Text( 'Latitude '+latt.toString(),),
                      Text( 'longitude '+longg.toString(),),
                      Text( 'Adress '+_draggedAddress,),

                    ],
                  ),

                )
            ),
          );

        },
        child: Container(
          width: 50,
          height: 50,
          child: Image.asset("assets/placeholder1.png"),
        ),
      ),
    );
  }
  Future<void> addoffer()  async {


    final url = Uri.parse(Apiconst.logistic_deliveryupdate);

    final request = http.MultipartRequest('POST', url);

    request.fields['current_lat'] = latt.toString();
    request.fields['current_long'] = longg.toString();
    request.fields['drop_lat'] = widget.loc.buyerlat.toString();
    request.fields['drop_long'] = widget.loc.buyerlong.toString();
    request.fields['pick_lat'] = widget.loc.farmerlat.toString();
    request.fields['pick_long'] = widget.loc.farmerlong.toString();
    request.fields['transactionid'] = widget.loc.transactionid.toString();
    request.fields['address'] = _draggedAddress.toString();
    request.fields['logisticstatus'] = '$logistic';

    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print(data);
      print("merasaman");
      if (data["status"] == "200") {
        rvh();
        setState(() {
          rvh();
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 16.0);
        Navigator.pop(context);
      } else {
        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 16.0);

        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
