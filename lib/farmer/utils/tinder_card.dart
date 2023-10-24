import 'package:flutter/material.dart';

class Content {
  final String productname;
  final String customername;
  final String price;
  final String quantity;
  final String location;
  final Image image;

  Content(this.customername, this.price, this.quantity, this.location,
      this.image, this.productname);
}

List<Content> contents = [
  Content(
    'Rahul',
    '₹ 1000',
    "10 tons",
    "Indra Nagar, Lucnkow",
    Image.asset("assets/maize.jpeg"),
    'Maize',
  ),
  Content(
    'Vinay',
    '₹ 1000',
    "10 tons",
    "Gomti Nagar Lucnkow",
    Image.asset("assets/maize.jpeg"),
    'commedity',
  ),
  Content(
    'Siddhu',
    '₹ 1000',
    "10 tons",
    "Tedhi Pulia Lucnkow",
    Image.asset("assets/maize.jpeg"),
    'Moringa Powder',
  ),
  Content(
    'Rakesh',
    '₹ 1000',
    "10 tons",
    "Hazratganj Lucnkow",
    Image.asset("assets/maize.jpeg"),
    'Moringa',
  )
];
