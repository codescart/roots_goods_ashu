class
logistictransection {
  int? id;
  dynamic? ratings;
  String? transactionid;
  String? transactiondate;
  String? paymentstatus;
  String? paymentrecivedDate;
  String? logisticspaystatus;
  String? logisticstatus;
  String? cropname;
  String? quantityinton;
  String? buyerlocation;
  String? farmerlocation;
  String? farmername;
  String? farmercontact;
  String? farmerlat;
  String? farmerlong;
  String? buyerlat;
  String? buyerlong;
  String? priceperkm;
  String? buyertotalamount;
  String? logisticsname;
  String? logisticsContact;
  String? buyername;
  String? buyercontact;




  logistictransection(
      {
        required this.id,
        required this.ratings,
        required this.transactionid,
        required this.transactiondate,
        required this.paymentstatus,
        required this.paymentrecivedDate,
        required this.logisticspaystatus,
        required this.logisticstatus,
        required this.cropname,
        required this.quantityinton,
        required this.buyerlocation,
        required this.farmerlocation,
        required this.farmername,
        required this.farmercontact,
        required this.farmerlat,
        required this.farmerlong,
        required this.buyerlat,
        required this.buyerlong,
        required this.priceperkm,
        required this.buyertotalamount,
        required this.logisticsname,
        required this.logisticsContact,
        required this.buyername,
        required this.buyercontact,
      }
      );


  factory logistictransection.fromJson(Map<String, dynamic> json) {
    return logistictransection(
      id: json["id"],
      ratings: json["ratings"],
      transactionid: json["transactionid"],
      transactiondate: json["transactiondate"],
      paymentstatus: json["paymentstatus"],
      paymentrecivedDate: json["paymentrecived_date"],
      logisticspaystatus: json["logisticspaystatus"],
      logisticstatus: json["logisticstatus"],
      cropname: json["cropname"],
      quantityinton: json["quantityinton"],
      buyerlocation: json["buyerlocation"],
      farmerlocation: json["farmerlocation"],
      farmername: json["farmername"],
      farmercontact: json["farmercontact"],
      farmerlat: json["farmerlat"],
      farmerlong: json["farmerlong"],
      buyerlat: json["buyerlat"],
      buyerlong: json["buyerlong"],
      priceperkm: json["priceperkm"],
      buyertotalamount: json["buyertotalamount"],
      logisticsname: json["logisticsname"],
      logisticsContact: json["logistics_contact"],
      buyername: json["buyername"],
      buyercontact: json["buyercontact"],
    );
  }

}