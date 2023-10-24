import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roots_goods/offer/list.dart';
import 'package:roots_goods/offer/model.dart';
import 'package:roots_goods/offer/offer.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // final List<String> product = [
  //   "Maize",
  //   "Commodity",
  //   "Moringa Oleifera",
  // ];

  // final List<String> _animalsss = [
  //   "₹ 1000",
  //   "₹ 2000",
  //   "₹ 3000",
  // ];
  // the selected value
  String? _selectedAnimal;

  String? _selectedAnimalss;
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  String date = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Offer Detail',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter some text';
                //     }
                //     return null;
                //   },
                //   decoration: const InputDecoration(
                //     hintText: 'Product',
                //   ),
                //   onChanged: (value) {
                //     setState(() {
                //       title = value;
                //     });
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffix: const Text(
                        "Tons",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      labelText: 'Enter quantity of maize',
                      prefixIcon: const Icon(
                        Icons.production_quantity_limits,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(),
                      ),
                      hintText: 'Enter quantity',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                  ),
                  // child: DropdownButtonFormField<String>(
                  //   decoration:
                  //       const InputDecoration(border: OutlineInputBorder()),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please Select Products';
                  //     }
                  //     return null;
                  //   },
                  //   value: _selectedAnimal,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       title = value.toString();
                  //     });
                  //   },
                  //   hint: const Center(
                  //       child: Text(
                  //     'Select Products',
                  //     style: TextStyle(color: Colors.grey),
                  //   )),
                  //   // Hide the default underline
                  //   // set the color of the dropdown menu
                  //   dropdownColor: const Color.fromARGB(255, 130, 185, 132),
                  //   icon: const Icon(
                  //     Icons.arrow_downward,
                  //     color: Colors.green,
                  //   ),
                  //   isExpanded: true,

                  //   // The list of options
                  //   items: product
                  //       .map((e) => DropdownMenuItem(
                  //             value: e,
                  //             child: Container(
                  //               alignment: Alignment.centerLeft,
                  //               child: Text(
                  //                 e,
                  //                 style: const TextStyle(fontSize: 18),
                  //               ),
                  //             ),
                  //           ))
                  //       .toList(),
                  // ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 20,
                //     right: 20,
                //   ),
                //   child: DropdownButtonFormField<String>(
                //     decoration:
                //         const InputDecoration(border: OutlineInputBorder()),

                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please Select Price';
                //       }
                //       return null;
                //     },
                //     value: _selectedAnimalss,
                //     onChanged: (value) {
                //       setState(() {
                //         description = value.toString();
                //       });
                //     },
                //     hint: const Center(
                //         child: Text(
                //       'Select Price',
                //       style: TextStyle(color: Colors.grey),
                //     )),
                //     // Hide the default underline
                //     // set the color of the dropdown menu
                //     // set the color of the dropdown menu
                //     dropdownColor: const Color.fromARGB(255, 130, 185, 132),
                //     icon: const Icon(
                //       Icons.arrow_downward,
                //       color: Colors.green,
                //     ),
                //     isExpanded: true,

                //     // The list of options
                //     items: _animalsss
                //         .map((e) => DropdownMenuItem(
                //               value: e,
                //               child: Container(
                //                 alignment: Alignment.centerLeft,
                //                 child: Text(
                //                   e,
                //                   style: const TextStyle(fontSize: 18),
                //                 ),
                //               ),
                //             ))
                //         .toList(),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffix: const Text(
                        "Rupees",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      labelText: "Enter price",
                      prefixIcon: const Icon(
                        Icons.currency_rupee_sharp,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(),
                      ),
                      hintText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 20,
                //     right: 20,
                //   ),
                //   child: TextFormField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please enter some text';
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //       prefixIcon: const Icon(
                //         Icons.currency_rupee_sharp,
                //         color: Colors.black,
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(0),
                //         borderSide: const BorderSide(),
                //       ),
                //       hintText: 'Price',
                //     ),
                //     keyboardType: TextInputType.number,
                //     onChanged: (value) {
                //       setState(() {
                //         date = value;
                //       });
                //     },
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 20,
                //     right: 20,
                //   ),
                //   child: TextFormField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please enter some text';
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //       prefixIcon: const Icon(
                //         Icons.currency_rupee_sharp,
                //         color: Colors.black,
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(0),
                //         borderSide: const BorderSide(),
                //       ),
                //       hintText: 'Price',
                //     ),
                //     keyboardType: TextInputType.number,
                //     onChanged: (value) {
                //       setState(() {
                //         name = value;
                //       });
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // foreground
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await DatabaseHandler()
                            .inserttodo(
                              todo(
                                // name: name,
                                // date: date,
                                title: title,
                                description: description,
                                id: Random().nextInt(50),
                              ),
                            )
                            .whenComplete(() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListScreen()),
                                ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // File? filee;
  // final pickerr = ImagePicker();

  // void _choosee() async {
  //   final pickedFile = await pickerr.getImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 50,
  //       maxHeight: 500,
  //       maxWidth: 500);
  //   setState(() {});
  // }
}
