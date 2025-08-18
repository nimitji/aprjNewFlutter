import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/app_color.dart';
import '../../Constants/assets_path.dart';
import '../../Constants/size.dart';
import '../../GlobalUtilities/Controllers/profileController.dart';
import '../../profiles/Profiles.dart';
import '../../profiles/category_model.dart';

class Category extends StatelessWidget {
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProfileController _profile = Get.find();
    return Container(
      color: kshade5,
      //height: ResponsiveSize.screenHeight*0.46,
      child: Column(
        children: [
          _profile.showcat.value
              ? SizedBox(
                height: ResponsiveSize.screenHeight * 0.11,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  //padding: EdgeInsets.only(left: 10),
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: CategoryItem(
                          widthSize: getScreeWidth(100),
                          item: categoryList[index],
                        ),
                      ),
                    );
                  },
                ),
              )
              : Container(),
          Container(
            color: Colors.white,
            //height:500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("नाम (Name)", style: TextStyle(fontSize: 12)),
                      Container(
                        width: 220,

                        child: TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _name,
                          onChanged: (value) {
                            print(value);
                            _profile.getfilterbyname(
                              value,
                              _profile.nameselected,
                            );
                          },
                          decoration: InputDecoration(
                            labelText: "नाम (Name)",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("शहर (City)", style: TextStyle(fontSize: 12)),
                      Container(
                        width: 220,

                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: kPrimaryColor),
                        ),

                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text("City", style: TextStyle(fontSize: 12)),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue) {
                            _profile.expandedfiter.value = false;
                            if (newValue != "NA") {
                              print(newValue);
                              _profile.Nselected.value =
                                  _profile.selected
                                      .where(
                                        (profile) =>
                                            profile.WorkCity!
                                                .toLowerCase()
                                                .startsWith(
                                                  newValue!.toLowerCase(),
                                                ) ||
                                            profile.BirthPlace!
                                                .toLowerCase()
                                                .startsWith(
                                                  newValue.toLowerCase(),
                                                ) ||
                                            profile
                                                .ContactInfoobj!
                                                .VillageLocality!
                                                .toLowerCase()
                                                .startsWith(
                                                  newValue.toLowerCase(),
                                                ) ||
                                            profile.ContactInfoobj!.City!
                                                .toLowerCase()
                                                .startsWith(
                                                  newValue.toLowerCase(),
                                                ),
                                      )
                                      .toList();
                            } else {
                              _profile.Nselected.value =
                                  _profile.selected.value;
                            }
                            /*setState(() {
                                      city = newValue;
                                      issearching=true;
                                      _filtername(newValue, 16);

                                    });*/
                          },
                          items:
                              <String>[
                                "NA",
                                "AHMEDABAD",
                                "SURAT",
                                "ASHOK NAGAR",
                                "AGRA",
                                "AMBAH",
                                "AJMER",
                                "BHOPAL",
                                "BANDEL",
                                "DHOLPUR",
                                "DABRA",
                                "DELHI",
                                "ISAGARH",
                                "FIROZABAD",
                                "GUNA",
                                "INDORE",
                                "UJJAIN",
                                "JHANSI",
                                "KOTA",
                                "JAIPUR",
                                "KASBA THANA",
                                "KARERA",
                                "KOLARAS",
                                "KANKROLI",
                                "KOLKATA",
                                "MORENA",
                                "MANIYA",
                                "MAKRANA",
                                "MUMBAI",
                                "MORAR",
                                "GWALIOR",
                                "GOHAD",
                                "POHARI",
                                "NARWAR",
                                "RAJAKHEDA",
                                "SHIVPURI",
                                "VADODARA",
                                "BANGLORE",
                                "PUNE",
                                "GURUGRAM",
                                "GHAZIABAD",
                                "HYDERABAD",
                                "PRAYAGRAJ",
                                "SHAMSHABAD",
                                "FARIDABAD",
                                "SHEOPUR",
                                "OUT OF INDIA",
                                "NOIDA",
                                "Other(टाइप करे)",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "शिक्षा (Qualification)",
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        width: 220,

                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: kPrimaryColor),
                        ),

                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(
                            "Qualification",
                            style: TextStyle(fontSize: 12),
                          ),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue) {
                            print(newValue);
                            _profile.expandedfiter.value = false;
                            if (newValue != "NA") {
                              _profile.Nselected.value =
                                  _profile.selected
                                      .where(
                                        (profile) => profile.Qualification!
                                            .toLowerCase()
                                            .contains(newValue!.toLowerCase()),
                                      )
                                      .toList();
                              print(_profile.Nselected.length);
                            } else {
                              _profile.Nselected.value =
                                  _profile.selected.value;
                            }
                          },
                          items:
                              <String>[
                                "NA",
                                "M.A",
                                "Intermediate",
                                "MBA",
                                "B.TECH",
                                "B.COM",
                                "M.COM",
                                "B.E",
                                "HIGHER SEC",
                                "B.A",
                                "MBBS",
                                "B.SC",
                                "MIDDLE",
                                "BCA",
                                "BBA",
                                "MCA",
                                "GRADUATION",
                                "POST GRADUATION",
                                "CA",
                                "LLB",
                                "DIPLOMA",
                                "M.TECH",
                                "BAMS",
                                "M.PHARMA",
                                "B.PHARMA",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "व्यवसाय (Profession)",
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        width: 220,

                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: kPrimaryColor),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(
                            "Profession",
                            style: TextStyle(fontSize: 12),
                          ),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue) {
                            _profile.expandedfiter.value = false;
                            if (newValue != "NA") {
                              _profile.Nselected.value =
                                  _profile.selected
                                      .where(
                                        (profile) => profile.Profession!
                                            .toLowerCase()
                                            .startsWith(
                                              newValue!.toLowerCase(),
                                            ),
                                      )
                                      .toList();
                            } else {
                              _profile.Nselected.value =
                                  _profile.selected.value;
                            }
                          },
                          items:
                              <String>[
                                "NA",
                                "BUSINESS",
                                "SOFTWARE ENGINNER",
                                "SUPERVISOR",
                                "CONSULTANT",
                                "ASSISTANT MANAGER",
                                "CONTRACTOR",
                                "BANK MANAGER",
                                "INCHARGE",
                                "TEACHER",
                                "DISTRIBUTOR",
                                "MANAGER",
                                "ENTREPRENEUR",
                                "ACCOUNTANT",
                                "ACCOUNT OFFICER",
                                "HEAD",
                                "TEAM LEADER",
                                "AGENT",
                                "DEALER",
                                "INTERN",
                                "PROFESSOR",
                                "ENGINEER",
                                "DESIGNER",
                                "OPERATOR",
                                "BROKER",
                                "LIEUTENANT",
                                "ADVOCATE",
                                "ANALYST",
                                "PLANNER",
                                "DEVELOPER",
                                "OBSERVER",
                                "OFFICER",
                                "SCIENTIST",
                                "STENO",
                                "SURVEYOR",
                                "DIRECTOR",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("आयु से", style: TextStyle(fontSize: 12)),
                        SizedBox(width: 20),
                        Container(
                          width: 70,

                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),

                          child: DropdownButton<String>(
                            value: _profile.fage.value,

                            //hint: Text("Age greater",style: TextStyle(fontSize: 25),),
                            // icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 20,
                            onChanged: (String? newValue) {
                              print(newValue);
                              _profile.fage.value = newValue!;
                              _profile.expandedfiter.value = false;
                              if (newValue != "0") {
                                _profile.Nselected.value =
                                    _profile.selected
                                        .where(
                                          (profiles) =>
                                              int.parse(profiles.Age!) >=
                                                  int.parse(
                                                    _profile.fage.value,
                                                  ) &&
                                              int.parse(profiles.Age!) <=
                                                  int.parse(
                                                    _profile.tage.value,
                                                  ),
                                        )
                                        .toList();
                                print(int.parse(_profile.fage.value));

                                print(_profile.Nselected.length);
                              } else {
                                _profile.Nselected.value =
                                    _profile.selected.value;
                              }
                            },
                            items:
                                <String>[
                                  "0",
                                  "18",
                                  "19",
                                  "20",
                                  "21",
                                  "22",
                                  "23",
                                  "24",
                                  "25",
                                  "26",
                                  "27",
                                  "28",
                                  "29",
                                  "30",
                                  "31",
                                  "32",
                                  "33",
                                  "34",
                                  "35",
                                  "36",
                                  "37",
                                  "38",
                                  "39",
                                  "40",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text("आयु तक", style: TextStyle(fontSize: 12)),
                        SizedBox(width: 20),
                        Container(
                          width: 70,

                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),

                          child: DropdownButton<String>(
                            //hint: Text("Age greater",style: TextStyle(fontSize: 25),),
                            // icon: Icon(Icons.arrow_downward),
                            value: _profile.tage.value,
                            iconSize: 24,
                            elevation: 20,
                            onChanged: (String? newValue) {
                              _profile.tage.value = newValue!;
                              _profile.expandedfiter.value = false;
                              if (newValue != "0") {
                                _profile.Nselected.value =
                                    _profile.selected
                                        .where(
                                          (profiles) =>
                                              int.parse(profiles.Age!) >=
                                                  int.parse(
                                                    _profile.fage.value,
                                                  ) &&
                                              int.parse(profiles.Age!) <=
                                                  int.parse(
                                                    _profile.tage.value,
                                                  ),
                                        )
                                        .toList();
                              } else {
                                _profile.Nselected.value =
                                    _profile.selected.value;
                              }
                            },
                            items:
                                <String>[
                                  "0",
                                  "18",
                                  "19",
                                  "20",
                                  "21",
                                  "22",
                                  "23",
                                  "24",
                                  "25",
                                  "26",
                                  "27",
                                  "28",
                                  "29",
                                  "30",
                                  "31",
                                  "32",
                                  "33",
                                  "34",
                                  "35",
                                  "36",
                                  "37",
                                  "38",
                                  "39",
                                  "40",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green,
                        ),
                      ), // background
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, this.item, this.widthSize, this.isCat = false})
    : super(key: key);
  final CategoryModel? item;
  final double? widthSize;
  final bool? isCat;
  /*Positioned(
            left: 15,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item!.discount}",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: isCat! ? getTextSize(14) : getTextSize(12),
                    fontWeight: isCat! ? FontWeight.w600 : FontWeight.w600,
                  ),
                ),
                getVerticalSpace(3),
                Text(
                  "${item!.title}",
                  style: TextStyle(
                    color: kDarkText,
                    fontSize: getTextSize(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                getVerticalSpace(15),
                SizedBox(
                  height: isCat! ? getScreenHeight(30) : getScreenHeight(25),
                  width: isCat! ? getScreeWidth(90) : getScreeWidth(80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    onPressed: () {
                      print("clicked");
                      getcatbuttonfunction(item!.title!);
                    },
                    child: FittedBox(
                      child: Text(
                        "Shop Now".toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isCat! ? getTextSize(12) : getTextSize(10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
  @override
  Widget build(BuildContext context) {
    ProfileController _profile = Get.find();
    return InkWell(
      onTap: () {
        _profile.getfilteredforinside(item!.title!);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileList()),
        );
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* SizedBox(height: getScreenHeight(50) ,
              width: getScreeWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: FadeInImage(
                  placeholder: AssetImage('images/image/placeholder.jpg'),
                  image: AssetImage("${item!.imgUrl}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: getScreenHeight(30),
                width: getScreeWidth(70),
                child: Image.asset(item!.imgUrl!),
              ),
            ),
            getVerticalSpace(3),
            SizedBox(
              width: getScreeWidth(60),
              child: Text(
                item!.title!.length > 13
                    ? "${item!.title}".substring(0, 13) + ".."
                    : "${item!.title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getTextSize(10),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getfiltered(String s) {
    ProfileController _profile = Get.find();

    switch (s) {
      case 'Engineer':
        _profile.title.value = "Engineers";
        // _profile.showcat.value=false;
        //_profile.selected.clear();
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("engineer") ||
                      profile.Qualification!.toLowerCase().contains(
                        "engineer",
                      ) ||
                      profile.Qualification!.toLowerCase().endsWith("tech"),
                )
                .toList();
        break;
      case 'Business':
        //_profile.selected.clear();
        _profile.title.value = "Business";
        //_profile.showcat.value=false;
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("business"),
                )
                .toList();
        break;
      case 'Doctor':
        //_profile.selected.clear();
        _profile.title.value = "Doctor";
        // _profile.showcat.value=false;
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("doctor") ||
                      profile.Profession!.toLowerCase().contains("medical") ||
                      profile.Designation!.toLowerCase().contains("doctor") ||
                      profile.Designation!.toLowerCase().contains("medical") ||
                      profile.Designation!.toLowerCase().contains("md") ||
                      profile.Designation!.toLowerCase().contains("dentist") ||
                      profile.Qualification!.toLowerCase().contains("mbbs") ||
                      profile.Qualification!.toLowerCase().contains("pharma") ||
                      profile.Qualification!.toLowerCase().contains("bhms") ||
                      profile.Qualification!.toLowerCase().contains("bds"),
                )
                .toList();
        ;
        break;
      case 'CA':
        _profile.title.value = "CA";
        //_profile.showcat.value=false;
        // _profile.selected.clear();
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("ca") ||
                      profile.Qualification!.toLowerCase().startsWith("cs") ||
                      profile.Designation!.toLowerCase().startsWith("ca") ||
                      profile.Designation!.toLowerCase().startsWith("cs") ||
                      profile.Profession!.toLowerCase().startsWith("ca") ||
                      profile.Profession!.toLowerCase().startsWith("cs"),
                )
                .toList();
        ;
        break;
      case 'Teacher':
        _profile.title.value = "Teacher";
        //_profile.showcat.value=false;
        //_profile.selected.clear();
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Designation!.toLowerCase().contains("teacher") ||
                      profile.Designation!.toLowerCase().contains("lecturer") ||
                      profile.Designation!.toLowerCase().contains(
                        "professor",
                      ) ||
                      profile.Designation!.toLowerCase().contains("tution") ||
                      profile.Designation!.toLowerCase().contains("coaching") ||
                      profile.Designation!.toLowerCase().contains(
                        "instructor",
                      ) ||
                      profile.Qualification!.toLowerCase().endsWith("ed") ||
                      profile.Profession!.toLowerCase().contains("teacher") ||
                      profile.Profession!.toLowerCase().contains("lecturer") ||
                      profile.Profession!.toLowerCase().contains("tution") ||
                      profile.Profession!.toLowerCase().contains("coaching"),
                )
                .toList();
        break;
    }
  }

  /* getcatbuttonfunction(String title) {

    switch(title){
      case "Mobiles":
        Get.toNamed(AppRoute.products,arguments: ProductCatArgs("Mobile Phone",0));
        break;
      case "Laptops":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Computers",0));
          break;
      case "Accessories":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Mobile Accessories",0 ));
        break;
      case "Smart Watch":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Fitness Band",1) );
        break;
      case "HeadPhones":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Neck Band",1) );
        break;
      case "Earphones":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Earphones",1) );
        break;
      case "True Wireless Stereo":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("True Wireless Stereo",1) );
        break;
      case "Speakers":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Speaker",1 ) );
        break;
      case "Tablets":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Computers",0 ) );
        break;
      case "Peripherals":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Keyboard",1 ));
        break;
      case "Cables":
        Get.toNamed(AppRoute.products,arguments:ProductCatArgs("Cable",1 ) );
        break;
      default:
        if(kDebugMode){
          print(title);
          print("Mobile clicked");
        }


    }

  }*/
}

class CityClass extends StatelessWidget {
  const CityClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kshade5,
      height: ResponsiveSize.screenHeight * 0.11,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        //padding: EdgeInsets.only(left: 10),
        itemBuilder: (ctx, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: CityItem(
                widthSize: getScreeWidth(100),
                item: categoryList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CityItem extends StatelessWidget {
  const CityItem({Key? key, this.item, this.widthSize, this.isCat = false})
    : super(key: key);
  final CategoryModel? item;
  final double? widthSize;
  final bool? isCat;
  /*Positioned(
            left: 15,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item!.discount}",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: isCat! ? getTextSize(14) : getTextSize(12),
                    fontWeight: isCat! ? FontWeight.w600 : FontWeight.w600,
                  ),
                ),
                getVerticalSpace(3),
                Text(
                  "${item!.title}",
                  style: TextStyle(
                    color: kDarkText,
                    fontSize: getTextSize(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                getVerticalSpace(15),
                SizedBox(
                  height: isCat! ? getScreenHeight(30) : getScreenHeight(25),
                  width: isCat! ? getScreeWidth(90) : getScreeWidth(80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    onPressed: () {
                      print("clicked");
                      getcatbuttonfunction(item!.title!);
                    },
                    child: FittedBox(
                      child: Text(
                        "Shop Now".toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isCat! ? getTextSize(12) : getTextSize(10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getfiltered(item!.title!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileList()),
        );
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* SizedBox(height: getScreenHeight(50) ,
              width: getScreeWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: FadeInImage(
                  placeholder: AssetImage('images/image/placeholder.jpg'),
                  image: AssetImage("${item!.imgUrl}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
            /*     Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: getScreenHeight(30) ,
                  width: getScreeWidth(70),
                  child: Image.asset(item!.imgUrl!),
            ),),
            getVerticalSpace(3),*/
            SizedBox(
              width: getScreeWidth(60),
              child: Text(
                item!.title!.length > 13
                    ? "${item!.title}".substring(0, 13) + ".."
                    : "${item!.title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getTextSize(10),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getfiltered(String s) {
    ProfileController _profile = Get.find();

    switch (s) {
      case 'Engineer':
        _profile.title.value = "Engineers";
        _profile.showcat.value = false;
        //_profile.selected.clear();
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("engineer") ||
                      profile.Qualification!.toLowerCase().contains(
                        "engineer",
                      ) ||
                      profile.Qualification!.toLowerCase().endsWith("tech"),
                )
                .toList();
        break;
      case 'Business':
        //_profile.selected.clear();
        _profile.title.value = "Business";
        _profile.showcat.value = false;
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("business"),
                )
                .toList();
        break;
      case 'Doctor':
        //_profile.selected.clear();
        _profile.title.value = "Doctor";
        _profile.showcat.value = false;
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("doctor") ||
                      profile.Profession!.toLowerCase().contains("medical") ||
                      profile.Designation!.toLowerCase().contains("doctor") ||
                      profile.Designation!.toLowerCase().contains("medical") ||
                      profile.Designation!.toLowerCase().contains("md") ||
                      profile.Designation!.toLowerCase().contains("dentist") ||
                      profile.Qualification!.toLowerCase().contains("mbbs") ||
                      profile.Qualification!.toLowerCase().contains("pharma") ||
                      profile.Qualification!.toLowerCase().contains("bhms") ||
                      profile.Qualification!.toLowerCase().contains("bds"),
                )
                .toList();
        ;
        break;
      case 'CA':
        _profile.title.value = "CA";
        _profile.showcat.value = false;
        // _profile.selected.clear();
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("ca") ||
                      profile.Qualification!.toLowerCase().startsWith("cs") ||
                      profile.Designation!.toLowerCase().startsWith("ca") ||
                      profile.Designation!.toLowerCase().startsWith("cs") ||
                      profile.Profession!.toLowerCase().startsWith("ca") ||
                      profile.Profession!.toLowerCase().startsWith("cs"),
                )
                .toList();
        ;
        break;
      case 'Teacher':
        _profile.title.value = "Teacher";
        _profile.showcat.value = false;
        //_profile.selected.clear();
        _profile.selected.value =
            _profile.selected
                .where(
                  (profile) =>
                      profile.Designation!.toLowerCase().contains("teacher") ||
                      profile.Designation!.toLowerCase().contains("lecturer") ||
                      profile.Designation!.toLowerCase().contains(
                        "professor",
                      ) ||
                      profile.Designation!.toLowerCase().contains("tution") ||
                      profile.Designation!.toLowerCase().contains("coaching") ||
                      profile.Designation!.toLowerCase().contains(
                        "instructor",
                      ) ||
                      profile.Qualification!.toLowerCase().endsWith("ed") ||
                      profile.Profession!.toLowerCase().contains("teacher") ||
                      profile.Profession!.toLowerCase().contains("lecturer") ||
                      profile.Profession!.toLowerCase().contains("tution") ||
                      profile.Profession!.toLowerCase().contains("coaching"),
                )
                .toList();
        break;
    }
  }
}

class CategoryItemforhomescreen extends StatelessWidget {
  const CategoryItemforhomescreen({
    Key? key,
    this.item,
    this.widthSize,
    this.isCat,
  }) : super(key: key);
  final CategoryModel? item;
  final double? widthSize;
  final bool? isCat;

  @override
  Widget build(BuildContext context) {
    ProfileController _profile = Get.find();
    return InkWell(
      onTap: () {
        _profile.getfiltered(item!.title!);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileList()),
        );
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: getScreenHeight(30),
                width: getScreeWidth(70),
                child: Image.asset(item!.imgUrl!),
              ),
            ),
            getVerticalSpace(3),
            SizedBox(
              width: getScreeWidth(60),
              child: Text(
                item!.title!.length > 13
                    ? "${item!.title}".substring(0, 13) + ".."
                    : "${item!.title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getTextSize(10),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterModalContent extends StatefulWidget {
  const FilterModalContent({super.key});

  @override
  State<FilterModalContent> createState() => _FilterModalContentState();

  static Future<Map<String, bool>?> open(BuildContext context) {
    return showModalBottomSheet<Map<String, bool>>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FilterModalContent(),
    );
  }
}

class _FilterModalContentState extends State<FilterModalContent> {
  String selectedCategory = 'शहर (City)';
  var selectedFilters = [];
  ProfileController _profile = Get.find();

  final Map<String, List<String>> filterData = {
    'शहर (City)': [
      "NA",
      "AHMEDABAD",
      "SURAT",
      "ASHOK NAGAR",
      "AGRA",
      "AMBAH",
      "AJMER",
      "BHOPAL",
      "BANDEL",
      "DHOLPUR",
      "DABRA",
      "DELHI",
      "ISAGARH",
      "FIROZABAD",
      "GUNA",
      "INDORE",
      "UJJAIN",
      "JHANSI",
      "KOTA",
      "JAIPUR",
      "KASBA THANA",
      "KARERA",
      "KOLARAS",
      "KANKROLI",
      "KOLKATA",
      "MORENA",
      "MANIYA",
      "MAKRANA",
      "MUMBAI",
      "MORAR",
      "GWALIOR",
      "GOHAD",
      "POHARI",
      "NARWAR",
      "RAJAKHEDA",
      "SHIVPURI",
      "VADODARA",
      "BANGLORE",
      "PUNE",
      "GURUGRAM",
      "GHAZIABAD",
      "HYDERABAD",
      "PRAYAGRAJ",
      "SHAMSHABAD",
      "FARIDABAD",
      "SHEOPUR",
      "OUT OF INDIA",
      "NOIDA",
      "Other(टाइप करे)",
    ],
    'Qualification': [
      "NA",
      "M.A",
      "Intermediate",
      "MBA",
      "B.TECH",
      "B.COM",
      "M.COM",
      "B.E",
      "HIGHER SEC",
      "B.A",
      "MBBS",
      "B.SC",
      "MIDDLE",
      "BCA",
      "BBA",
      "MCA",
      "GRADUATION",
      "POST GRADUATION",
      "CA",
      "LLB",
      "DIPLOMA",
      "M.TECH",
      "BAMS",
      "M.PHARMA",
      "B.PHARMA",
    ],
    'Profession': [
      "NA",
      "BUSINESS",
      "SOFTWARE ENGINNER",
      "SUPERVISOR",
      "CONSULTANT",
      "ASSISTANT MANAGER",
      "CONTRACTOR",
      "BANK MANAGER",
      "INCHARGE",
      "TEACHER",
      "DISTRIBUTOR",
      "MANAGER",
      "ENTREPRENEUR",
      "ACCOUNTANT",
      "ACCOUNT OFFICER",
      "HEAD",
      "TEAM LEADER",
      "AGENT",
      "DEALER",
      "INTERN",
      "PROFESSOR",
      "ENGINEER",
      "DESIGNER",
      "OPERATOR",
      "BROKER",
      "LIEUTENANT",
      "ADVOCATE",
      "ANALYST",
      "PLANNER",
      "DEVELOPER",
      "OBSERVER",
      "OFFICER",
      "SCIENTIST",
      "STENO",
      "SURVEYOR",
      "DIRECTOR",
    ],
    'Age': [],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8.0),

          // Category + Options
          Expanded(
            child: Row(
              children: [
                // Categories
                Expanded(
                  flex: 3,
                  child: ListView(
                    children:
                        filterData.keys.map((cat) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: filterCategoryItem(cat),
                          );
                        }).toList(),
                  ),
                ),

                const VerticalDivider(width: 30),

                Expanded(
                  flex: 5,
                  child:
                      selectedCategory == "Age"
                          ? Obx(
                            () => Column(
                              children: [
                                Text("आयु से", style: TextStyle(fontSize: 12)),
                                SizedBox(height: 20),
                                Container(
                                  width: 90,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: kPrimaryColor),
                                  ),

                                  child: DropdownButton<String>(
                                    value: _profile.fage.value,
                                    iconSize: 24,
                                    elevation: 20,
                                    onChanged: (String? newValue) {
                                      print(newValue);
                                      _profile.fage.value = newValue!;
                                      _profile.expandedfiter.value = false;
                                      if (newValue != "0") {
                                        _profile.Nselected.value =
                                            _profile.selected
                                                .where(
                                                  (profiles) =>
                                                      int.parse(
                                                            profiles.Age!,
                                                          ) >=
                                                          int.parse(
                                                            _profile.fage.value,
                                                          ) &&
                                                      int.parse(
                                                            profiles.Age!,
                                                          ) <=
                                                          int.parse(
                                                            _profile.tage.value,
                                                          ),
                                                )
                                                .toList();
                                        print(int.parse(_profile.fage.value));

                                        print(_profile.Nselected.length);
                                      } else {
                                        _profile.Nselected.value =
                                            _profile.selected.value;
                                      }
                                    },
                                    items:
                                        <String>[
                                          "0",
                                          "18",
                                          "19",
                                          "20",
                                          "21",
                                          "22",
                                          "23",
                                          "24",
                                          "25",
                                          "26",
                                          "27",
                                          "28",
                                          "29",
                                          "30",
                                          "31",
                                          "32",
                                          "33",
                                          "34",
                                          "35",
                                          "36",
                                          "37",
                                          "38",
                                          "39",
                                          "40",
                                        ].map<DropdownMenuItem<String>>((
                                          String value,
                                        ) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("आयु तक", style: TextStyle(fontSize: 12)),
                                SizedBox(height: 20),
                                Container(
                                  width: 90,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: kPrimaryColor),
                                  ),

                                  child: DropdownButton<String>(
                                    value: _profile.tage.value,
                                    iconSize: 24,
                                    elevation: 20,
                                    onChanged: (String? newValue) {
                                      _profile.tage.value = newValue!;
                                      _profile.expandedfiter.value = false;
                                      if (newValue != "0") {
                                        _profile.Nselected.value =
                                            _profile.selected
                                                .where(
                                                  (profiles) =>
                                                      int.parse(
                                                            profiles.Age!,
                                                          ) >=
                                                          int.parse(
                                                            _profile.fage.value,
                                                          ) &&
                                                      int.parse(
                                                            profiles.Age!,
                                                          ) <=
                                                          int.parse(
                                                            _profile.tage.value,
                                                          ),
                                                )
                                                .toList();
                                      } else {
                                        _profile.Nselected.value =
                                            _profile.selected.value;
                                      }
                                    },
                                    items:
                                        <String>[
                                          "0",
                                          "18",
                                          "19",
                                          "20",
                                          "21",
                                          "22",
                                          "23",
                                          "24",
                                          "25",
                                          "26",
                                          "27",
                                          "28",
                                          "29",
                                          "30",
                                          "31",
                                          "32",
                                          "33",
                                          "34",
                                          "35",
                                          "36",
                                          "37",
                                          "38",
                                          "39",
                                          "40",
                                        ].map<DropdownMenuItem<String>>((
                                          String value,
                                        ) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : ListView(
                            children: createFilterList(
                              selectedCategory,
                              filterData[selectedCategory] ?? [],
                            ),
                          ),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.black),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() => selectedFilters.clear());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Clear All'),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, selectedFilters);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget filterCategoryItem(String category) {
    return GestureDetector(
      onTap: () {
        selectedFilters = [];
        setState(() => selectedCategory = category);
      },
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: selectedCategory == category ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createFilterList(String category, List<String> options) {
    return options.map((option) {
      return CheckboxListTile(
        value: selectedFilters.contains(option),
        onChanged: (value) {
          setState(() {
            if (selectedFilters.length == 0) {
              selectedFilters.add(option);
            } else {
              selectedFilters = [];
              selectedFilters.add(option);
            }
          });
          if (selectedFilters.length > 0) {
            if (category == 'शहर (City)') {
              _profile.Nselected.value =
                  _profile.profiles.where((user) {
                    print(user.BirthPlace);
                    return selectedFilters.contains(
                      (user.BirthPlace ?? "").toUpperCase(),
                    );
                  }).toList();
            } else if (category == 'Qualification') {
              _profile.Nselected.value =
                  _profile.profiles
                      .where(
                        (user) => selectedFilters.contains(user.Qualification),
                      )
                      .toList();
            } else {
              _profile.title.value = option;
              _profile.Nselected.value =
                  _profile.profiles
                      .where(
                        (user) => selectedFilters.contains(user.Profession),
                      )
                      .toList();
            }
          } else {
            _profile.Nselected.value = _profile.profiles;
          }
        },
        title: Text(
          option,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      );
    }).toList();
  }
}
