import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class logisticsOffers extends StatefulWidget {
  const logisticsOffers({super.key});

  @override
  State<logisticsOffers> createState() => _OfferState();
}

class _OfferState extends State<logisticsOffers> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController date = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController _sourceController = TextEditingController();
  TextEditingController _km = TextEditingController();
  TextEditingController _ton = TextEditingController();

  @override
  void initState() {
    // DateTime selectedDate = DateTime.now();
    super.initState();

  }
  late LatLng destination;
  late LatLng source;
  bool showSourceField = false;
  static const kGoogleApiKey = Apiconst.mapkey;
  Future<String> showGoogleAutoComplete() async {
    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "us",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      components: [new Component(Component.country, "in")],
      types: ["(cities)"],
      hint: "Search City",
    );
    return p!.description!;
  }
  Future<LatLng> buildLatLngFromAddress(String place) async {
    List<geoCoding.Location> locations =
    await geoCoding.locationFromAddress(place);
    return LatLng(locations.first.latitude, locations.first.longitude);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

        ),
        title: const Text(
          "Add Offer",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller:_ton,
                decoration: InputDecoration(
                  counter: const Offstage(),
                  //contentPadding: EdgeInsets.all(20),
                  hintText: 'Capacity in Ton',
                  prefixIcon: const Icon(
                    Icons.fire_truck,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
                // controller: hospital_name,
                keyboardType: TextInputType.phone,
              ),
               SizedBox(
                height: 20,
              ),
              TextField(
                controller:_km,
                decoration: InputDecoration(
                  counter: const Offstage(),
                  //contentPadding: EdgeInsets.all(20),
                  hintText: 'Price per KM',
                  prefixIcon: const Icon(
                    Icons.currency_rupee,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
                // controller: hospital_name,
                keyboardType: TextInputType.number,
              ),


              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: destinationController,
                readOnly: true,
                onTap: () async {


                  String selectedPlace = await showGoogleAutoComplete();

                  // String selectedPlace = p!.description!;

                  destinationController.text = selectedPlace;

                  setState(() {
                    showSourceField = true;
                  });
                  List<geoCoding.Location> locations =
                  await geoCoding.locationFromAddress(selectedPlace);

                  destination =
                      LatLng(locations.first.latitude, locations.first.longitude);
                  print(destination);
                  print('destination');
                  print(destination.latitude);
                  print(destination.longitude);



                  setState(() {
                    _sourceController.clear();
                    // showSourceField = true;
                  });
                },
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                decoration: InputDecoration(
                  counter: const Offstage(),
                  //contentPadding: EdgeInsets.all(20),
                  hintText: 'Source Location',
                  prefixIcon: const Icon(
                    Icons.pin_drop,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none //<-- SEE HERE
                  ),
                ),
              ),
              showSourceField ?
              TextFormField(
                controller: _sourceController,
                readOnly: true,
                onTap: () async {
                  String place = await showGoogleAutoComplete();
                  _sourceController.text = place;
                  source = await buildLatLngFromAddress(place);
                  List<geoCoding.Location> locations =
                  await geoCoding.locationFromAddress(place);
                  source = LatLng(
                      locations.first.latitude, locations.first.longitude);
                  print(source.latitude);
                  print(source.longitude);
                },

                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                decoration: InputDecoration(
                  counter: const Offstage(),
                  //contentPadding: EdgeInsets.all(20),
                  hintText: 'Destination Location',
                  prefixIcon: const Icon(
                    Icons.pin_drop,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none //<-- SEE HERE
                  ),
                ),
              )
                  : Container(),
              SizedBox(
                height: 20,
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
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.calendar_month)),
                  counter: const Offstage(),
                  //contentPadding: EdgeInsets.all(20),
                  hintText: 'Estimated Travel Date',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 90,
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      addoffer(
                        _ton.text,
                          _km.text,
                          destinationController.text,
                          _sourceController.text,
                        date.text
                      );
                    },
                    child: Container(
                      width: 90,
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
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> addoffer(
      String _ton,
      String _km,
      String destinationController,
      String _sourceController,
      String date
      )  async {
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL
    // http://3.111.255.71:8000/api/v1/add/logistic/offer
    final url = Uri.parse(Apiconst.logistic_add_offer);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);


    // Add the form fields
    request.fields['userid'] = '$userid';
    request.fields['vehicecapacity'] = _ton;
    request.fields['priceperdistance'] = _km;
    request.fields['source'] = destinationController;
    request.fields['destination'] = _sourceController;
    request.fields['traveldate'] = date;
    request.fields['picklat'] = '${destination.latitude}';
    request.fields['picklong'] = '${destination.longitude}';
    request.fields['droplat'] = '${source.latitude}';
    request.fields['droplong'] = '${source.longitude}';



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
}
