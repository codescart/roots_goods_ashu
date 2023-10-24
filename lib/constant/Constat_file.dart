
class Apiconst{
///map key
  static const String mapkey= 'AIzaSyBt0XXMqrIAoo-tec72ZeRgnpQF4bkm4Tw';

   ///rootsgood official map key

  ///  'AIzaSyCZ0SYA8r5nVEW9wWHoDHj0HqaDDeeh5NE';


///baseurl
  static const String  baseurl="http://3.111.255.71:8000/api/v1/";

  /// image url
  static const String imgurl = 'http://bdgss.org:8000/';
  static const String imgcropurl = 'http://bdgss.org:8000/media/';
  static const String otpurl = 'https://api.textlocal.in/send/?apikey=Ivp4hmerrTs-3NiLaoXMHdS8oFxCeNH6gvvufBDlEA&numbers=';



///login url
  static const String  login=baseurl+"user/login";
  ///role url
  static const String  Role=baseurl+"roles/get";


/// term_condition
  static const String  term_condition=baseurl+"get/term_condition";

  /// admin account detail
  static const String  admin_account_detail =baseurl+"admin/account/view";


  /// about us
  static const String  aboutus=baseurl+"get/aboutus";

  ///  privecy_policies
  static const String  privecy_policies=baseurl+"get/privacy";

  ///  feedback
  static const String  feedback=baseurl+"post/feedback";

  /// register url
  static const String  Register=baseurl+"user/save";
  ///  crop get
  static const String Crop =baseurl+"crop/get";
  ///ADD FARMER OFFER
  static const String farmer_offer =baseurl+"add/farmer/offer";

  /// rating view
  static const String rating_view =baseurl+"ratings/get?";



  /// update_rating
  static const String update_rating =baseurl+"ratings/update";





  /// Farmer offer view
  static const String offer_view =baseurl+"farmer/offer/list/";


  /// Farmer notification offer view
  ///  http://3.111.255.71:8000/api/v1/farmer/notification/3
  static const String notification_offer_view =baseurl+"farmer/notification/";


  ///  farmer notification reject
  static const String farmer_notification_reject =baseurl+"farmer/reject";

  ///  farmer notification accept
  ///    http://3.111.255.71:8000/api/v1/farmer/accept
  static const String farmer_notification_accept =baseurl+"farmer/accept";


  /// Farmer transaction
 // http://3.111.255.71:8000/api/v1/farmer/transaction/3
  static const String Farmer_transaction =baseurl+"farmer/transaction/";


  /// Farmer Selected offer
  static const String selected_view =baseurl+"farmermatch/offer/";

  ///farmer upload certificate
  static const String upload_certificate =baseurl+"farmer/add/certificate";

  ///farmer certificateid check
  static const String certificateid_check =baseurl+"fcerticateidtab";

  ///  farmer offer detail view img
  static const String offer_view_img =baseurl+"farmer/get/certificate?";


  /// farmer certificateId
  static const String certificateid =baseurl+"certificate/get/inofferadd/";


  static const String certificateidview =baseurl+"certificate/get/";


  /// Farmer Edit Profile
  static const String farmereditpro =baseurl+"user/update/profile";


  ///farmer profile
  static const String farmer_profile =baseurl+"user/profile?";





///----------------**** Buyer ***---------------///

  /// buyer_add offer
  static const String buyer_addoffer =baseurl+"add/buyer/offer";


  /// buyer tranction screenshort


  static const String buyer_tranction_screenshort =baseurl+"transaction/reciept/image";


  ///  buyer_matched offer farmer
  static const String buyer_matched_offer_farmer =baseurl+"buyer/matchoffer/byfarmer/";


  ///  buyer_matched_offer_logistic
  static const String buyer_matched_offer_logistic =baseurl+"buyer/matchoffer/logistic/";
  /// buyer_get offer
  static const String buyer_getoffer =baseurl+"buyer/offer/list/";

  /// buyer quality parameter
  static const String buyer_quality_parameter =baseurl+"all/get/certificate";

  /// buyer certificate img
  static const String buyer_certi_img =baseurl+"farmer/get/certificate?";


  /// buyer transction
  static const String buyer_transction ="${baseurl}buyer/transaction/";



  ///   buyer_farmer_offer_reject -
  static const String buyer_farmer_offer_reject ="${baseurl}buyer/rejectoffer/farmer";

/// buyer_Logistic_offer_reject
  static const String buyer_Logistic_offer_reject =baseurl+"buyer/rejectoffer/logistics";

 ///  buyer_Logistic_offer_accept
  static const String buyer_Logistic_offer_accept =baseurl+"buyer/acceptoffer/logistics";


  ///buyer_farmer_offer_accept-
  static const String buyer_farmer_offer_accept =baseurl+"buyer/acceptoffer/farmer";


  /// buyer notification farmer offer
  static const String buyer_notification_farmer_offer =baseurl+"buyer/notification/";



  /// buyer_notification_reject_farmer
  static const String buyer_notification_reject_farmer =baseurl+"buyer/rejectnotification/farmer";


  /// buyer_notification_accept_farmer
  static const String buyer_notification_accept_farmer =baseurl+"buyer/acceptnotification/farmer";



  ///  logistics_notification_inbuyer
  static const String logistics_notification_inbuyer =baseurl+"logistics/notification/inbuyer/";


  ///    buyer logistics_notification_reject
  static const String logistics_notification_reject =baseurl+"buyer/rejectnotification/logistics";


///  buyer logistics_notification_accept
  static const String logistics_notification_accept =baseurl+"buyer/acceptnotification/logistics";




  ///----------------**** Logistic ***---------------///




/// logistic_add offer
 static const String logistic_add_offer =baseurl+"add/logistic/offer";

/// logistic your offer
 static const String logistic_your_offer =baseurl+"logisticoffer/";


 /// logistic trtansction
 static const String logistic_trtansction =baseurl+"logistics/transaction/";



 ///  logistic_deliverystatus
 static const String logistic_deliverystatus =baseurl+"deliverystatus/dropdown";


 ///  logistic_delivery update
 static const String logistic_deliveryupdate =baseurl+"update/trackingdata";


 /// logistic_notification

 static const String logistic_notification =baseurl+"logistics/notification/";

 /// logistic_notification_reject

 static const String logistic_notification_reject =baseurl+"logistics/reject/notification";


 /// logistic_notification_accept
 static const String logistic_notification_accept =baseurl+"logistics/accept/notification";


 ///  logistic_matched_offer
 static const String logistic_matched_offer =baseurl+"logistics/matchoffer/";



}