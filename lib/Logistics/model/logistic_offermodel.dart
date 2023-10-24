
class LofferModel {
  dynamic? id;
  dynamic? offerdate;
  String? traveldate;
  dynamic? price;
  String? source_location;
  String? destination_location;
  String? logistics_id;
  String? quantity;

  LofferModel({
    this.id,
    this.offerdate,
    this.traveldate,
    this.price,
    this.source_location,
    this.destination_location,
    this.logistics_id,
    this.quantity,
  });
  factory LofferModel.fromJson(Map<String, dynamic> json) {
    return LofferModel(
        id: json['id'],
        offerdate: json['offerdate'],
        traveldate: json['traveldate'],
        price: json['price'],
        source_location: json['source_location'],
        destination_location: json['destination_location'],
        logistics_id: json['logistics_id'],
        quantity: json['quantity'],
    );}
}