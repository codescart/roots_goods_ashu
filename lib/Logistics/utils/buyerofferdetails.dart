// import 'package:flutter/material.dart';
// import 'package:roots_goods/Logistics/utils/Farmerviewdetailoffer.dart';
// import 'package:roots_goods/farmer/uploadproducts.dart';
//
// class BuyerUpdatePrics extends StatefulWidget {
//   const BuyerUpdatePrics({super.key});
//
//   @override
//   State<BuyerUpdatePrics> createState() => _UpdatePricsState();
// }
//
// class _UpdatePricsState extends State<BuyerUpdatePrics> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 10,
//               right: 10,
//             ),
//             child: Row(
//               children: [
//                 const Text(
//                   "Your offers",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17,
//                   ),
//                 ),
//                 const Spacer(),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const UploadProduct(),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     color: const Color(
//                       0xffA1D567,
//                     ),
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Padding(
//                             padding: EdgeInsets.all(2),
//                             child: Icon(
//                               Icons.add,
//                               color: Colors.black,
//                               size: 13,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               "Add New Offer",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             color: Colors.white,
//             alignment: Alignment.bottomLeft,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 12,
//                     top: 10,
//                     bottom: 10,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Crop Name : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "Maize",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Quantity In Ton : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "₹ 20",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Price Per Ton : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "₹ 1200",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   const Farmer_View_offer_Detail(),
//                             ),
//                           );
//                         },
//                         child: const Card(
//                           color: Color(0xffA1D567),
//                           child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 "View Details",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             color: Colors.white,
//             alignment: Alignment.bottomLeft,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Crop Name : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "Maize",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Quantity In Ton : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "₹ 20",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Price Per Ton : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "₹ 1200",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   const Farmer_View_offer_Detail(),
//                             ),
//                           );
//                         },
//                         child: const Card(
//                           color: Color(0xffA1D567),
//                           child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 "View Details",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             color: Colors.white,
//             alignment: Alignment.bottomLeft,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Crop Name : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "Maize",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Quantity In Ton : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "₹ 20",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Price Per Ton : ",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffD88A63),
//                             ),
//                           ),
//                           Text(
//                             "₹ 1200",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xff747474),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   const Farmer_View_offer_Detail(),
//                             ),
//                           );
//                         },
//                         child: const Card(
//                           color: Color(0xffA1D567),
//                           child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 "View Details",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
