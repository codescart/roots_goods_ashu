// import 'dart:io';

// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class MyAppss extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyAppss> {
//   final picker = ImagePicker();
//   final pdf = pw.Document();
//   final List<File> _image = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("image to pdf"),
//         actions: [
//           IconButton(
//               icon: const Icon(Icons.picture_as_pdf),
//               onPressed: () {
//                 createPDF();
//                 savePDF();
//               })
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImageFromGallery,
//         child: const Icon(Icons.add),
//       ),
//       body: _image != null
//           ? ListView.builder(
//               itemCount: _image.length,
//               itemBuilder: (context, index) => Container(
//                   height: 400,
//                   width: double.infinity,
//                   margin: const EdgeInsets.all(8),
//                   child: Image.file(
//                     _image[index],
//                     fit: BoxFit.cover,
//                   )),
//             )
//           : const CircularProgressIndicator(),
//     );
//   }

//   getImageFromGallery() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image.add(File(pickedFile.path));
//       } else {
//         print(
//           'No image selected',
//         );
//       }
//     });
//   }

//   createPDF() async {
//     for (var img in _image) {
//       final image = pw.MemoryImage(img.readAsBytesSync());

//       pdf.addPage(pw.Page(
//           pageFormat: PdfPageFormat.a4,
//           build: (pw.Context contex) {
//             return pw.Center(child: pw.Image(image));
//           }));
//     }
//   }

//   savePDF() async {
//     try {
//       final dir = await getExternalStorageDirectory();
//       final file = File('${dir!.path}/filename.pdf');
//       await file.writeAsBytes(await pdf.save());
//       showPrintedMessage('success', 'saved to documents');
//     } catch (e) {
//       showPrintedMessage('error', e.toString());
//     }
//   }

//   showPrintedMessage(String title, String msg) {
//     Flushbar(
//       title: title,
//       message: msg,
//       duration: const Duration(seconds: 3),
//       icon: const Icon(
//         Icons.info,
//         color: Colors.blue,
//       ),
//     ).show(context);
//   }
// }
