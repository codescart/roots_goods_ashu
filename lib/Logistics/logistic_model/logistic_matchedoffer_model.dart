class logistic_matchedoffer_model {

  String? logisticsprice;
  int? logisticsofferid;
  String? logisticsid;
  String? logisticsource;
  String? logisticdestination;
  int? farmerofferid;
  String? farmerid;
  String? farmerquantity;
  String? farmerpickuplocation;
  int? buyerofferid;
  String? buyerquantity;
  String? buyerprice;
  String? buyerlocation;
  String? buyerid;
  String? logisticsname;
  String? buyername;
  String? farmername;
  double? dist;
  String? cropname;


  logistic_matchedoffer_model({
    this.logisticsprice,
    this.logisticsofferid,
    this.logisticsid,
    this.logisticsource,
    this.logisticdestination,
    this.farmerofferid,
    this.farmerid,
    this.farmerquantity,
    this.farmerpickuplocation,
    this.buyerofferid,
    this.buyerquantity,
    this.buyerprice,
    this.buyerlocation,
    this.buyerid,
    this.logisticsname,
    this.buyername,
    this.farmername,
    this.dist,
    this.cropname,

  });


  factory logistic_matchedoffer_model.fromJson(Map<String, dynamic> json) {
    return logistic_matchedoffer_model(
      logisticsprice: json["logisticsprice"],
      logisticsofferid: json["logisticsofferid"],
      logisticsid: json["logisticsid"],
      logisticsource: json["logisticsource"],
      logisticdestination: json["logisticdestination"],
      farmerofferid: json["farmerofferid"],
      farmerid: json["farmerid"],
      farmerquantity: json["farmerquantity"],
      farmerpickuplocation: json["farmerpickuplocation"],
      buyerofferid: json["buyerofferid"],
      buyerquantity: json["buyerquantity"],
      buyerprice: json["buyerprice"],
      buyerlocation: json["buyerlocation"],
      buyerid: json["buyerid"],
      logisticsname: json["logisticsname"],
      buyername: json["buyername"],
      farmername: json["farmername"],
      dist: json["dist"]?.toDouble(),
      cropname: json["cropname"],

    );
  }


}