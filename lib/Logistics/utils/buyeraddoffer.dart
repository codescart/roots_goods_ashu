import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BuyerUploadProduct extends StatefulWidget {
  const BuyerUploadProduct({super.key});

  @override
  State<BuyerUploadProduct> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<BuyerUploadProduct> {

  String? crop;
  List crop_data = [];
  Future<String> Cropps() async {
    final res = await http.get(Uri.parse(
        Apiconst.Crop));
    final resBody = json.decode(res.body)["data"];
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      crop_data = resBody;
    });
    return "Sucess";
  }
  // the selected value

  @override
  void initState() {
    // DateTime selectedDate = DateTime.now();
    super.initState();
    Cropps();
    _init();

    // Future<void> _selectDate(BuildContext context) async {
    //   final DateTime? picked = await showDatePicker(
    //       context: context,
    //       initialDate: selectedDate,
    //       firstDate: DateTime(2015, 8),
    //       lastDate: DateTime(2101));
    //   if (picked != null && picked != selectedDate) {
    //     setState(() {
    //       selectedDate = picked;
    //     });
    //   }
    // }
  }

  double totalAmount = 0.0;
  void calculateTotalAmount() {
    setState(() {
      double value1 = double.tryParse(amount1Controller.text) ?? 0.0;
      double value2 = double.tryParse(amount2Controller.text) ?? 0.0;
      totalAmount = value1 * value2;
    });
  }

  TextEditingController amount1Controller = TextEditingController();
  TextEditingController amount2Controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final TextEditingController Totalamount = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController Quality = TextEditingController();
  final TextEditingController destinationcon = TextEditingController();


  @override
  void dispose() {
    amount1Controller.dispose();
    amount2Controller.dispose();
    Totalamount.dispose();
    date.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Add Offer",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(onPressed: () { Navigator.pop(context); },
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 12,
            centerTitle: true,
          ),
          //appBar
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child:  DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Row(
                      children: [
                        Icon(
                          Icons.energy_savings_leaf,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10,),
                        Text('Crop Name'),
                      ],
                    ),
                    items: crop_data.map((item) {
                      return DropdownMenuItem(
                          child:  Container(

                            height: 100.h,
                            width: 500.w,
                            child: ListTile(
                              leading: Image.network(Apiconst.imgcropurl+
                                  item['image'].toString(),
                                height: 70.r,
                                width: 70.r,
                              ),
                              trailing:  Text(
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
                          value: item['id'].toString());
                    }).toList(),
                    onChanged: (value) async {
                      setState(() {
                        crop = value as String;

                      });

                    },
                    value: crop,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: amount1Controller,
                onChanged: (value) {
                  calculateTotalAmount();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counter: const Offstage(),
                  prefixIcon: Image.asset("assets/storage1.png"),
                  suffix: const Text("Quantity in Tons"),
                  hintText: 'Quantity in Tons',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: amount2Controller,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  calculateTotalAmount();
                },
                decoration: InputDecoration(
                  suffix: const Text(
                    "Price Per Tons",
                  ),
                  counter: const Offstage(),
                  hintText: 'Price Per Tons',
                  prefixIcon: const Icon(
                    Icons.currency_rupee_sharp,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                readOnly: true,
                controller: Totalamount..text= totalAmount.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefix: const Text(
                    "Total Amount: ",
                  ),
                  counter: const Offstage(),
                  prefixIcon: const Icon(
                    Icons.currency_rupee_sharp,
                    color: Colors.grey,
                  ),
                  hintText: 'Total Amount',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                readOnly: true,
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101))
                      .then((pickeddate) {
                    if (pickeddate != null) {
                      setState(() {
                        selectedDate = pickeddate;
                        date.text = "${selectedDate.toLocal()}".split(' ')[0];
                      });
                    }
                    return null;
                  });
                },
                controller: date,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                  counter: const Offstage(),
                  //contentPadding: EdgeInsets.all(20),
                  hintText: 'Selling Date',
                  suffix: const Text("Selling Date"),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
               SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.85,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    boxShadow: const [
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>  Dialog(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                          backgroundColor: Color(0xffA1D567),
                          child: _buildChild(context),
                        ),
                      );
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/placeholder1.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Choose your Delivery Location',
                            style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),)
                      :InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>  Dialog(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: _buildChild(context),
                        ),
                      );
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
                      padding: const EdgeInsets.symmetric(
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
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        amount1Controller.clear();
                        amount2Controller.clear();
                        date.clear();
                        date.clear();
                        Totalamount.clear();
                        crop_data.clear();
                        //search.clear();
                      });
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffD88A63),
                        border: Border.all(
                          color: const Color(0xffD88A63),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      addoffer(amount1Controller.text,
                          amount2Controller.text,Totalamount.text,
                          date.text) ;
                    },
                    child: Container(
                      width: 70,
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
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }





  Future<void> addoffer(String amount1Controller,
      String amount2Controller,
      String Totalamount ,String date,
      )  async {
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL
    final url = Uri.parse(Apiconst.buyer_addoffer);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);

    // Add the form fields
    request.fields['cropid'] = '$crop';
    request.fields['quantity'] = "$amount1Controller";
    request.fields['price'] = '$amount2Controller';
    request.fields['delivery_location'] = '$_draggedAddress';
    request.fields['buyer_id'] = '$userid';
    request.fields['totalamount'] = '$Totalamount';
    request.fields['date'] = '$date';
    request.fields['lat'] = '$latt';
    request.fields['long'] = '$longg';




    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print(data);
      print("merasaman");
      // Check if the request was successful
      if (data["status"] == "200") {
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



  _buildChild(BuildContext context) =>Container(
    height: 350,
    padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Column(
      children: <Widget>[
        Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose your Location', style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w600, fontSize: 12, ),),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [

                    Container(
                      height: 270,
                      // height: MediaQuery.of(context).size.height * 0.85,
                      child: _buildBody(),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  Widget _buildBody() {
    return Stack(
        children : [
          _getMap(),
          _getTextField(),
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
            // border: Border.all(
            //   width: 1.2, color: Colors.black
            // ),
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
                  // child:Alerts(
                  //     lats:latt.toString(),
                  //     longs:longg.toString(),
                  //     address:_draggedAddress
                  // )
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

  String? _searchAddress;

  Widget _getTextField() {
    return Positioned(
      top: 10,
      left:0.0,
      right: 0.0,
      child:Container(
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10
              )
            ],
            borderRadius: BorderRadius.circular(8)
        ),
        child: TextFormField(
          controller: destinationcon,
          readOnly: true,
          onTap: ()async{
            String selectedPlace = await showGoogleAutoComplete();
            destinationcon.text=selectedPlace;
            setState(() {
              _searchAddress=selectedPlace;
              _searchAndSetMarker();
            });
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left:8,top: 10),
              hintText: 'Search Address',
              suffixIcon:Icon(Icons.search),
              border: InputBorder.none
          ),
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7),
          ),
        ),
      ),
    );
  }

  Future<String> showGoogleAutoComplete() async{
    const kGoogleApiKey = Apiconst.mapkey;

    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "In",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      components: [new Component(Component.country, "In")],
      types: ["(cities)"],
      hint: "Search City",);
    return p!.description!;
  }

  void _searchAndSetMarker() async {
    if (_searchAddress == null || _searchAddress!.isEmpty) return;

    var locations = await locationFromAddress(_searchAddress!);
    if (locations.isNotEmpty) {
      final LatLng latLng = LatLng(
        locations.first.latitude,
        locations.first.longitude,
      );
      setState(() {
        _moveCameraToLocation(latLng);
      }
      );
    }
  }

  Future<void> _moveCameraToLocation(LatLng latLng) async {
    GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 14.0,
        ),
      ),
    );
  }
}



