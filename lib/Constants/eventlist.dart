import 'assets_path.dart';

class EventModel{
  String? title;
  String? timing;
  String? venue;
  String? img;

  EventModel(this.title,this.timing,this.venue,this.img


      );
}


class GuestProfile{
  String? name;
  String? room;
  String? hotel;
  String? arrival;
  String? helpline;
  String? accompained;
  String? picklocation;
  String? droplocation;
  String? departure;
  String? driver;
  String? vehiclenumber;
  String? checkindate;
  String? checkout;
  String? kycSubmitted;
  String? contact;
  String? cusine;
  GuestProfile(this.name,this.room,this.hotel,this.arrival,this.helpline,this.accompained,
      this.picklocation,this.droplocation,this.departure,this.driver,this.vehiclenumber,this.checkindate,
      this.checkout,this.kycSubmitted,this.contact,this.cusine
      );
}
GuestProfile newguest=GuestProfile("Mr.& Mrs. Kumar","101","Radisson Blu","24/06/2022 at 02:00PM","Mohnish (#0123456789)","Family",
"IGI Airport New Delhi","IGI AirPort New Delhi","26/06/2022 at 03:00PM","Ramesh Singh","DL01L0123","24/06/2022 at 02:00PM","26/06/2022 at 03:00PM",
  "Yes","1234567890","Vegetarian"

);



List<EventModel> eventList = [
  EventModel("Haldi","02:00 PM","Royal Banquet",haldi),
  EventModel("Mehandi","03:00 PM","Royal Banquet",mehandi),
  EventModel("Sangeet","07:00 PM","Royal Banquet",sangeet),
  EventModel("Jaimala","08:00 PM","Royal Banquet",jaimala),
  EventModel("Wedding","08:00 PM","Royal Banquet",wedding),
  EventModel("AfterParty","08:00 PM","Royal Banquet",afterparty),


];



