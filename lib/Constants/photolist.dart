import 'assets_path.dart';

class BannerModel {
  String? title;
  String? timing;
  String? venue;
  String? img;
  String? orientation;

  BannerModel(this.title, this.timing, this.venue, this.img);
}

List<BannerModel> bannerlist = [
  //BannerModel("Haldi","02:00 PM","Royal Banquet",sang),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner3),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner4),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner5),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner6),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner11),
];
List<BannerModel> mainbanner = [
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner1),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner2),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner3),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner4),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner5),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner11),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner22),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner33),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner44),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner55),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", banner66),
  BannerModel("Haldi", "02:00 PM", "Royal Banquet", info),
];
