class CategoryModel {
  String? title;
  String? subtitle;
  String? discount;
  String? imgUrl;

  CategoryModel({this.title, this.subtitle, this.discount, this.imgUrl});

  CategoryModel.fromMap(Map<String, dynamic> map) {
    title = map['title']!;
    subtitle = map['subtitle']!;
    discount = map['discount']!;
    imgUrl = map['imgUrl']!;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['title'] = this.title;
    map['subtitle'] = this.subtitle;
    map['discount'] = this.discount;
    map['imgUrl'] = this.imgUrl;

    return map;
  }
}


class CityModel {
  String? title;
  String? subtitle;
  String? discount;
  String? imgUrl;

  CityModel({this.title, this.subtitle, this.discount, this.imgUrl});

  CityModel.fromMap(Map<String, dynamic> map) {
    title = map['title']!;
    subtitle = map['subtitle']!;
    discount = map['discount']!;
    imgUrl = map['imgUrl']!;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['title'] = this.title;
    map['subtitle'] = this.subtitle;
    map['discount'] = this.discount;
    map['imgUrl'] = this.imgUrl;

    return map;
  }
}


