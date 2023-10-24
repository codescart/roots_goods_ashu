class logistic_notification {


  int? notificationid;
  String? buyerofferid;
  String? farmerofferid;
  String? logisticsofferid;
  String? farmerid;
  String? buyerid;
  String? logisticsid;
  String? notificationstatus;
  String? farmerlocation;
  String? logisticsource;
  String? logisticdestination;
  String? logisticsprice;
  String? buyerquantity;
  String? buyerlocation;
  String? farmername;
  String? buyername;
  String? logisticsname;
  String? name;
  double? dist;
  String? buyerprice;


  logistic_notification({
      this.notificationid,
      this.buyerofferid,
      this.farmerofferid,
      this.logisticsofferid,
      this.farmerid,
      this.buyerid,
      this.logisticsid,
      this.notificationstatus,
      this.farmerlocation,
      this.logisticsource,
      this.logisticdestination,
      this.logisticsprice,
      this.buyerquantity,
      this.buyerlocation,
      this.farmername,
      this.buyername,
      this.logisticsname,
      this.name,
      this.dist,
    this.buyerprice,

  });


  factory logistic_notification.fromJson(Map<String, dynamic> json) {
    return logistic_notification(
      notificationid: json["notificationid"],
      buyerofferid: json["buyerofferid"],
      farmerofferid: json["farmerofferid"],
      logisticsofferid: json["logisticsofferid"],
      farmerid: json["farmerid"],
      buyerid: json["buyerid"],
      logisticsid: json["logisticsid"],
      notificationstatus: json["notificationstatus"],
      farmerlocation: json["farmerlocation"],
      logisticsource: json["logisticsource"],
      logisticdestination: json["logisticdestination"],
      logisticsprice: json["logisticsprice"],
      buyerquantity: json["buyerquantity"],
      buyerlocation: json["buyerlocation"],
      farmername: json["farmername"],
      buyername: json["buyername"],
      logisticsname: json["logisticsname"],
      name: json["name"],
      dist: json["dist"]?.toDouble(),
      buyerprice: json["buyerprice"],

    );
  }


}