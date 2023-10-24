import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
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

class RandomDigits {
  static const MaxNumericDigits = 17;
  static final _random = Random();

  static int getInteger(int digitCount) {
    if (digitCount > MaxNumericDigits || digitCount < 1) throw new RangeError.range(0, 1, MaxNumericDigits, "Digit Count");
    var digit = _random.nextInt(9) + 1;  // first digit must not be a zero
    int n = digit;

    for (var i = 0; i < digitCount - 1; i++) {
      digit = _random.nextInt(10);
      n *= 10;
      n += digit;
    }
    return n;
  }

  static String getString(int digitCount) {
    String s = "";
    for (var i = 0; i < digitCount; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }
}

class UploadCertificate extends StatefulWidget {
  const UploadCertificate({super.key});

  @override
  State<UploadCertificate> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UploadCertificate> {


  List<File> _images = [];
  List<String> _imageDataList = [];

  Future<void> _pickImages() async {
    List<XFile>? images =
    await ImagePicker().pickMultiImage(imageQuality: 30);
    if (images != null) {
      List<String> imageDataList = [];
      for (var image in images) {
        File file = File(image.path);
        List<int> imageBytes = await file.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        imageDataList.add(base64Image);
      }
      setState(() {
        _images = images.map((image) => File(image.path)).toList();
        _imageDataList = imageDataList;
      });
    }
  }


  Future<void> addoffer()  async {
    setState(() {
      _loading = true;
    });
    final randnum=RandomDigits.getInteger(12);
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL

    certificateid(randnum,userid!);


    final totaimage= _imageDataList.length;
    int forleng=0;

    for (   var i=0; i<_imageDataList.length; i++ ){
      setState(() {
        forleng=i.toInt();
      });
      final url = Uri.parse(Apiconst.upload_certificate);
      final request = http.MultipartRequest('POST', url);
      request.fields['farmerid'] = '$userid';
      request.fields['certificateid'] ='$randnum';
      request.fields['location'] = "$_draggedAddress";
      request.fields['image'] = _imageDataList[i] ;

      try {
        // Send the request and get the response
        final response = await request.send();
        final responseData = await response.stream.bytesToString();
        final data = json.decode(responseData);


        // Check if the request was successful
print(forleng);
print(totaimage);
        if(forleng+1 == totaimage){
          print(data);
          print("merasaman");
          if (data["status"] == "200") {
            setState(() {
              _loading = false;
            });
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: data['error'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                backgroundColor: Colors.green,
                fontSize: 16.0);

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
        }

      } catch (e) {
        print('Error: $e');
      }
    }

  }

  Future<void> certificateid(int ran,String userid)  async {

print('dataaaaa');
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL

      final url = Uri.parse(Apiconst.certificateid_check);
      final request = http.MultipartRequest('POST', url);
      request.fields['farmerid'] = '$userid';
      request.fields['certificateid'] ='$ran';
      request.fields['location'] = "$_draggedAddress";

      try {
        // Send the request and get the response
        final response = await request.send();
        final responseData = await response.stream.bytesToString();
        final data = json.decode(responseData);
      } catch (e) {
        print('Error: $e');
      }


  }


  bool _loading = false;


  @override
  void initState() {
    // DateTime selectedDate = DateTime.now();
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


  final TextEditingController destinationcon = TextEditingController();

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
          leading: IconButton(onPressed: () { Navigator.pop(context); },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

          ),
          title: const Text(
            "Upload",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 12,
          centerTitle: true,
        ),
        //appBar
        body: Container(
          // padding: EdgeInsets.only(right: 0,left: 10),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
              Container(
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
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 320,
                                // height: MediaQuery.of(context).size.height * 0.85,
                                child: _buildBody(),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                 SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 20,
                ),
                _images.length !=0?
                InkWell(
                //  onTap:_pickImages,
                  onTap: (){print(_imageDataList);
                    },
                  
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      itemCount: _images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        print('Radha');
                        print(_imageDataList);
                        print(_images[index]);
                        return Image.file(
                          _images[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                )
                :
                SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: DottedBorder(
                      child: Column(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.photo_album,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(
                            child: Text("Upload images/videos"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          ElevatedButton(
                        
                            onPressed: _pickImages,
                            child: Text('Pick Images'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                 SizedBox(
                  height: 10,
                ),


                _images.length !=0?
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
                ):Container(),
              ],
            ),
          ),
        ), //textform
      ),
    );
  }
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
