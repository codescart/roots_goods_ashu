


class logistic_offer {
  String? logisticsprice;
  dynamic? logisticsofferid;
  String? logisticsSource;
  String? logisticsDestination;
  dynamic? farmerofferid;
  dynamic? buyerofferid;
  String? buyerquantityinton;
  String? buyerpriceperton;
  String? buyerdeliverylocation;
  String? buyerid;
  String? logisticsName;
  String? farmerid;
  String? logisticsid;
  dynamic? dist;

  logistic_offer(
  {
  this.logisticsprice,
  this.logisticsofferid,
  this.logisticsSource,
  this.logisticsDestination,
  this.farmerofferid,
  this.buyerofferid,
  this.buyerquantityinton,
  this.buyerpriceperton,
  this.buyerdeliverylocation,
  this.buyerid,
  this.logisticsName,
  this.farmerid,
  this.logisticsid,
  this.dist,}

  );


  factory logistic_offer.fromJson(Map<String, dynamic> json) {
    return logistic_offer(
        logisticsprice: json["logisticsprice"],
        logisticsofferid: json["logisticsofferid"],
        logisticsSource: json["logistics_source"],
        logisticsDestination: json["logistics_destination"],
        farmerofferid: json["farmerofferid"],
        buyerofferid: json["buyerofferid"],
        buyerquantityinton: json["buyerquantityinton"],
        buyerpriceperton: json["buyerpriceperton"],
        buyerdeliverylocation: json["buyerdeliverylocation"],
        buyerid: json["buyerid"],
        logisticsName: json["logistics_name"],
        farmerid: json["farmerid"],
        logisticsid: json["logisticsid"],
        dist: json["dist"]?.toDouble(),

    );
  }

}




