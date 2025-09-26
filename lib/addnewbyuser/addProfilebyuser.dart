import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Constants/app_color.dart';
import '../Constants/assets_path.dart';
import '../Constants/routedart.dart';
import '../Constants/size.dart';
import '../classes/ContactInfo.dart';
import '../classes/PersonalProfile.dart';
import '../classes/PersonalProfilewithcontact.dart';
import '../utilities/Helpers/dialog_helper.dart';
import 'Image.dart';

class AddProfileByUser extends StatefulWidget {
  @override
  _AddprofileState createState() => _AddprofileState();
}

List data = [
  "व्यवसाय (Profession)",
  "ACCOUNT OFFICER",
  "ACCOUNTANT",
  "ADVOCATE",
  "AGENT",
  "AIRHOSTESS",
  "ANALYST",
  "ARCHITECT",
  "ASSISTANT MANAGER",
  "BANK MANAGER",
  "BEAUTY PARLOUR",
  "BROKER",
  "BUILDER",
  "BUSINESS",
  "CA",
  "CENTRAL GOVT JOB",
  "CHEF",
  "CONSULTANT",
  "CONTRACTOR",
  "CS",
  "DEALER",
  "DESIGNER",
  "DEVELOPER",
  "DIRECTOR",
  "DISTRIBUTOR",
  "DOCTOR",
  "ENGINEER",
  "ENTREPRENEUR",
  "GOVT JOB",
  "HEAD",
  "INCHARGE",
  "INTERN",
  "LIEUTENANT",
  "MANAGER",
  "OBSERVER",
  "OFFICER",
  "OPERATOR",
  "PILOT",
  "PLANNER",
  "PROFESSOR",
  "SCIENTIST",
  "SOFTWARE ENGINNER",
  "STATE GOVT JOB",
  "STENO",
  "SUPERVISOR",
  "SURVEYOR",
  "TEACHER",
  "TEAM LEADER",
  "YOGA INSTRUCTOR",
  "OTHER(टाइप करे)",
];
List fdata = [
  "पिता का व्यवसाय (Fathers Profession)",
  "ACCOUNT OFFICER",
  "ACCOUNTANT",
  "ADVOCATE",
  "AGENT",
  "AIRHOSTESS",
  "ANALYST",
  "ARCHITECT",
  "ASSISTANT MANAGER",
  "BANK MANAGER",
  "BEAUTY PARLOUR",
  "BROKER",
  "BUILDER",
  "BUSINESS",
  "CA",
  "CENTRAL GOVT JOB",
  "CHEF",
  "CONSULTANT",
  "CONTRACTOR",
  "CS",
  "DEALER",
  "DESIGNER",
  "DEVELOPER",
  "DIRECTOR",
  "DISTRIBUTOR",
  "DOCTOR",
  "ENGINEER",
  "ENTREPRENEUR",
  "GOVT JOB",
  "HEAD",
  "INCHARGE",
  "INTERN",
  "LIEUTENANT",
  "MANAGER",
  "OBSERVER",
  "OFFICER",
  "OPERATOR",
  "PILOT",
  "PLANNER",
  "PROFESSOR",
  "SCIENTIST",
  "SOFTWARE ENGINNER",
  "STATE GOVT JOB",
  "STENO",
  "SUPERVISOR",
  "SURVEYOR",
  "TEACHER",
  "TEAM LEADER",
  "YOGA INSTRUCTOR",
  "Other(टाइप करे)",
];
List ftData=[
  "ft",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7"
];
List itData=[
  "Inch",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11"
];
List dataq = [
  "शिक्षा (Qualification)",
  "10TH",
  "B A",
  "B ARCH",
  "B COM",
  "B E",
  "B LIB",
  "B PHARMA",
  "B SC",
  "B TECH",
  "BAMS",
  "BBA",
  "BCA",
  "BHMS",
  "CA",
  "CERTIFICATES",
  "COMPLETE SCIENCE",
  "CS",
  "DIPLOMA",
  "ENGINEER",
  "GRADUATION",
  "HIGHER SEC",
  "HOTEL MANAGEMENT",
  "JOURNALISM AND MASS COMMUNICATION",
  "LLB",
  "M ARCH",
  "M COM",
  "M LIB",
  "M PHARMA",
  "M PHIL",
  "M TECH",
  "MA",
  "MBA",
  "MBBS",
  "MCA",
  "ME",
  "MIDDLE /HIGHER SECONDARY/12TH",
  "MIDDLE",
  "MS",
  "NOT APPLICABLE",
  "PHD",
  "POST GRADUATION",
  "Other(टाइप करे)",
];
List datad = [
  "पद (Designation)",
  "ACCOUNT OFFICER",
  "ACCOUNTANT",
  "ADVOCATE",
  "AGENT",
  "ANALYST",
  "AREA MANAGER",
  "ASSISTANT MANAGER",
  "BANK MANAGER",
  "BRANCH MANAGER",
  "BROKER",
  "CEO",
  "CHAIRPERSON",
  "CONSULTANT",
  "CONTRACTOR",
  "DEALER",
  "DESIGNER",
  "DEVELOPER",
  "DIRECTOR",
  "DISTRIBUTOR",
  "ENGINEER",
  "ENTREPRENEUR",
  "HEAD",
  "HR MANAGER",
  "INCHARGE",
  "INTERN",
  "LIEUTENANT",
  "MANAGER",
  "MARKETING MANAGER",
  "NOT APPLICABLE",
  "OBSERVER",
  "OFFICER",
  "OPERATOR",
  "PLANNER",
  "PROFESSOR",
  "PROJECT MANAGER",
  "REGIONAL MANAGER",
  "SCIENTIST",
  "SENIOR MANAGER",
  "SOFTWARE ENGINEER",
  "STENO",
  "SUPERVISOR",
  "SURVEYOR",
  "TEACHER",
  "TEAM LEADER",
  "VICE PRESIDENT",
  "Other(टाइप करे)",
];
List dataci = [
  "City",
  "AGRA",
  "AHMEDABAD",
  "AJMER",
  "AMBAH",
  "ASHOK NAGAR",
  "BANDEL",
  "BANGLORE",
  "Banglore",
  "Bharuch",
  "BHOPAL",
  "Chennai",
  "DABRA",
  "DELHI",
  "Dewas",
  "DHOLPUR",
  "FARIDABAD",
  "FIROZABAD",
  "GHAZIABAD",
  "GOHAD",
  "GUNA",
  "GURUGRAM",
  "GWALIOR",
  "Haridwar",
  "Hindon (Raj)",
  "Howrah",
  "HYDERABAD",
  "INDORE",
  "ISAGARH",
  "JAIPUR",
  "JHANSI",
  "Jodhpur",
  "KANKROLI",
  "KARERA",
  "KASBA THANA",
  "Kodarma",
  "KOLARAS",
  "KOLKATA",
  "KOTA",
  "MAKRANA",
  "Mandsaur",
  "MANIYA",
  "MORAR",
  "MORENA",
  "MUMBAI",
  "NARWAR",
  "Navranpur, Orissa",
  "Neemuch",
  "NOIDA",
  "OUT OF INDIA",
  "Patna",
  "POHARI",
  "PRAYAGRAJ",
  "PUNE",
  "RAJAKHEDA",
  "Rannod",
  "Ratlam",
  "Saugor",
  "SHAMSHABAD",
  "SHEOPUR",
  "SHIVPURI",
  "SURAT",
  "Udaipur",
  "UJJAIN",
  "VADODARA",
  "Vayar (Raj.)",
  "Vidisha",
  "Other(टाइप करे)",
];
List incomeData=[
  "अनुमानित वार्षिक आय",
  "1 लाख से 2 लाख",
  "2 लाख से 3 लाख",
  "3 लाख से 4 लाख",
  "4 लाख से 5 लाख",
  "5 लाख से 6 लाख",
  "6 लाख से 7 लाख",
  "7 लाख से 8 लाख",
  "8 लाख से 9 लाख",
  "9 लाख से 10 लाख",
  "10 लाख से 12 लाख",
  "12 लाख से 14 लाख",
  "14 लाख से 16 लाख",
  "16 लाख से 18 लाख",
  "18 लाख से 20 लाख",
  "20 लाख से 25 लाख",
  "25 लाख से 30 लाख",
  "30 लाख से 35 लाख",
  "35 लाख से 40 लाख",
  "40 लाख से 45 लाख",
  "45 लाख से 50 लाख",
  "50 लाख से 60 लाख",
  "60 लाख से 70 लाख",
  "70 लाख से 80 लाख",
  "80 लाख से 90 लाख",
  "90 लाख से 1 करोड़",
  "1 करोड़ से अधिक "
];

class _AddprofileState extends State<AddProfileByUser> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _father = TextEditingController();
  final TextEditingController _mother = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _nameoforg = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _birthTime = TextEditingController();
  final TextEditingController _birthplace = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _workcity = TextEditingController();
  final TextEditingController _mobilenumber1 = TextEditingController();
  final TextEditingController _mobilenumber2 = TextEditingController();
  final TextEditingController _housenumber = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _village = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _country = TextEditingController(text: "India");
  final TextEditingController _namepfcp = TextEditingController();
  final TextEditingController _otherprof = TextEditingController();
  final TextEditingController _fatherprof = TextEditingController();
  final TextEditingController _otherqual = TextEditingController();
  final TextEditingController _brother = TextEditingController();
  final TextEditingController _sister = TextEditingController();
  final TextEditingController _otherdesig = TextEditingController();
  final TextEditingController _income = TextEditingController();
  final TextEditingController _special = TextEditingController();

  String genderddvalue = "चुनिए";
  String dayvalue = "DD";
  String monthvalue = "MM";
  String yearvalue = "YYYY";
  String ampm = "AM";
  String ftddvalue="ft";
  String inch="Inch";
  String Manglikddvalue = "चुनिए";
  String statedropdown = "राज्य (State)";
  String citydropdownvalue = "City";
  String professionddvalue = "व्यवसाय (Profession)";
  String incomeDdValue = "अनुमानित वार्षिक आय";
  String fatherprofessionddvalue = "पिता का व्यवसाय (Fathers Profession)";
  String designddvalue = "पद (Designation)";
  String qualificationddval = "शिक्षा (Qualification)";
  String dropdownvalue = "स्वयं का गोत्र";
  String dropdownvalue1 = "मामा का गोत्र";
  PersonalProfile? newprofile;
  String bartitle = "प्रोफाइल जोड़े";
  bool isenable = false;
  bool isqenable = false;
  bool isdenable = false;
  bool isfenable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _appBar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            ),

            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: Text(
                                "वर अथवा वधु ",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kPrimaryColor),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kPrimaryColor,
                                  ),
                                  value: genderddvalue,
                                  elevation: 10,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      genderddvalue = newValue!;
                                    });
                                  },
                                  items:
                                      <String>[
                                        "चुनिए",
                                        "वर",
                                        "वधु",
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
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: Text(
                                "मांगलिक",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kPrimaryColor),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kPrimaryColor,
                                  ),
                                  value: Manglikddvalue,
                                  iconSize: 24,
                                  elevation: 10,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      Manglikddvalue = newValue.toString();
                                    });
                                  },
                                  items:
                                      <String>[
                                        "चुनिए",
                                        "मांगलिक",
                                        "नॉन मांगलिक",
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
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _name,
                          decoration: InputDecoration(
                            labelText:
                                genderddvalue == "चुनिए"
                                    ? 'नाम (Name)'
                                    : '$genderddvalue का नाम (Name)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _father,
                          decoration: InputDecoration(
                            labelText: 'पिताजी का नाम (Father)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _mother,
                          decoration: InputDecoration(
                            labelText: 'माताजी का नाम(Mother)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _sister,
                          decoration: InputDecoration(
                            labelText: 'बहनें (Sisters)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _brother,
                          decoration: InputDecoration(
                            labelText: 'भाई (Brothers)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),

                        Container(
                          child: Text(
                            "जन्म तिथि (Date of Birth)",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 10.0),

                        InkWell(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );

                            if (picked != null) {
                              setState(() {
                                dayvalue = picked.day.toString();
                                monthvalue = picked.month.toString();
                                yearvalue = picked.year.toString();
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                dayvalue != "DD" &&
                                        monthvalue != "MM" &&
                                        yearvalue != "YYYY"
                                    ? '$dayvalue-$monthvalue-$yearvalue' +
                                        '  आयु (Age) ' +
                                        getageondate(
                                          dayvalue +
                                              "/" +
                                              monthvalue +
                                              "/" +
                                              yearvalue,
                                        ) +
                                        " वर्ष"
                                    : 'DD-MM-YYYY',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              "जन्म समय (Birth Time)",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        /* Container( decoration: BoxDecoration(border: Border.all(color:kPrimaryColor)),
                              child: TextFormField(
                                keyboardType:TextInputType.datetime,
                                controller: _dob,
                                decoration: InputDecoration(
                                    labelText: genderddvalue=="चुनिए"? 'जन्म तिथि (Date of Birth)':'$genderddvalue की जन्म तिथि (Date of Birth)',
                                    labelStyle:
                                    TextStyle(color: Colors.black, fontSize: 14)),
                              ),
                            ),*/
                        SizedBox(height: 10.0),
                        InkWell(
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              final now = DateTime.now();
                              final dt = DateTime(
                                now.year,
                                now.month,
                                now.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );

                              final formattedTime = DateFormat(
                                'hh:mm',
                              ).format(dt);

                              setState(() {
                                _birthTime.text = formattedTime;
                                ampm = DateFormat('a').format(dt);
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: kPrimaryColor),
                            ),
                            child: Center(
                              child: Text(
                                _birthTime.text != ""
                                    ? "${_birthTime.text} $ampm"
                                    : 'hh:mm',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _birthplace,
                          decoration: InputDecoration(
                            labelText:
                                genderddvalue == "चुनिए"
                                    ? 'जन्म स्थान (Birth Place)'
                                    : '$genderddvalue का जन्म स्थान (Birth Place)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        /*Container( decoration: BoxDecoration(border: Border.all(color:kPrimaryColor)),
                              child: TextFormField(
                                keyboardType:TextInputType.number,
                                controller: _height,
                                decoration: InputDecoration(
                                    labelText: genderddvalue=="चुनिए"? 'ऊंचाई (Height)':'$genderddvalue की ऊंचाई (Height)',
                                    labelStyle:
                                    TextStyle(color: Colors.black, fontSize: 14)),
                              ),
                            ),*/
                        // TextField(
                        //   keyboardType: TextInputType.number,
                        //   textCapitalization: TextCapitalization.characters,
                        //   controller: _height,
                        //   decoration: InputDecoration(
                        //     labelText:
                        //         genderddvalue == "चुनिए"
                        //             ? 'ऊंचाई (Height, 00.00 feet)'
                        //             : '$genderddvalue की ऊंचाई (Height 00.00)',
                        //     labelStyle: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14,
                        //     ),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 10.0),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: Text(
                                "ऊँचाई",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container( width:100,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kPrimaryColor),
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 20,
                                elevation: 10,
                                value: ftddvalue,
                                //hint: Text("ऊँचाई Height"),
                                items:
                                ftData.map((list) {
                                  return DropdownMenuItem(
                                    value: list,
                                    child: Text(list),
                                  );
                                }).toList(),
                                onChanged: (dynamic value) {
                                  setState(() {
                                    print(value);
                                    ftddvalue = value;
                                  });
                                },
                              ),
                            ),

                            Container( width:100,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kPrimaryColor),
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 20,
                                elevation: 10,
                                value: inch,
                                //hint: Text("ऊँचाई Height"),
                                items:
                                itData.map((list) {
                                  return DropdownMenuItem(
                                    value: list,
                                    child: Text(list),
                                  );
                                }).toList(),
                                onChanged: (dynamic value) {
                                  setState(() {
                                    print(value);
                                    inch = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 12,
                        //     vertical: 6,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(12),
                        //
                        //     border: Border.all(color: kPrimaryColor),
                        //   ),
                        //   child: DropdownButton(
                        //     isExpanded: true,
                        //     icon: Icon(Icons.arrow_downward),
                        //     iconSize: 20,
                        //     elevation: 10,
                        //     value: ft,
                        //     hint: Text("Height"),
                        //     items:
                        //     !isenable
                        //         ? ftData.map((list) {
                        //       return DropdownMenuItem(
                        //         child: Text(list),
                        //         value: list,
                        //       );
                        //     }).toList()
                        //         : ftData.map((list) {
                        //       return DropdownMenuItem(
                        //         value: list,
                        //         child: TextField(
                        //           style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 25,
                        //           ),
                        //           showCursor: true,
                        //           autofocus: true,
                        //
                        //           decoration: InputDecoration(
                        //             labelText: 'टाइप कीजिये ',
                        //             labelStyle: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 15,
                        //             ),
                        //           ),
                        //           controller: _height,
                        //         ),
                        //       );
                        //     }).toList(),
                        //
                        //     onChanged: (dynamic value) {
                        //       setState(() {
                        //         print(value);
                        //         if (value == "Other(टाइप करे)") {
                        //           isenable = true;
                        //           ft = value;
                        //         }
                        //         ft = value;
                        //       });
                        //     },
                        //   ),
                        // ),

                        SizedBox(height: 10.0),

                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),

                            iconSize: 20,
                            elevation: 10,
                            value: incomeDdValue,
                            hint: Text("अनुमानित वार्षिक आय"),
                            items:
                            !isenable
                                ?incomeData.map((list) {
                              return DropdownMenuItem(
                                child: Text(list),
                                value: list,
                              );
                            }).toList()
                                : incomeData.map((list) {
                              return DropdownMenuItem(
                                value: list,
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                  showCursor: true,
                                  autofocus: true,

                                  decoration: InputDecoration(
                                    labelText: 'टाइप कीजिये ',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  controller: _otherprof,
                                ),
                              );
                            }).toList(),

                            onChanged: (dynamic value) {
                              setState(() {
                                print(value);
                                if (value == "Other(टाइप करे)") {
                                  isenable = true;
                                  incomeDdValue = value;
                                }
                                incomeDdValue = value;
                              });
                            },
                          ),
                        ), //DR
                        // TextField(
                        //   keyboardType: TextInputType.number,
                        //   controller: _income,
                        //   decoration: InputDecoration(
                        //     labelText: 'अनुमानित आय (वार्षिक)',
                        //     labelStyle: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14,
                        //     ),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: _special,
                          decoration: InputDecoration(
                            labelText: 'विशेष',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        /* DropdownButton<String>(
                              isExpanded: true,
                              value:professionddvalue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 10,
                              onChanged: (String newValue){
                                setState(() {
                                  professionddvalue=newValue;
                                });
                              },
                              items:<String>[
                                "Profession",
                                "Business",
                                "Doctor",
                                "Service",
                                "Govt Service",
                                "Advocate",
                                "Accountant",
                                "Other",
                              ]
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value:value,
                                  child:Text(value),
                                );
                              }).toList(),
                            ),*/
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),

                            iconSize: 20,
                            elevation: 10,
                            value: professionddvalue,
                            hint: Text("व्यवसाय (Profession)"),
                            items:
                                !isenable
                                    ? data.map((list) {
                                      return DropdownMenuItem(
                                        child: Text(list),
                                        value: list,
                                      );
                                    }).toList()
                                    : data.map((list) {
                                      return DropdownMenuItem(
                                        value: list,
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                          showCursor: true,
                                          autofocus: true,

                                          decoration: InputDecoration(
                                            labelText: 'व्यवसाय टाइप कीजिये ',
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          controller: _otherprof,
                                        ),
                                      );
                                    }).toList(),

                            onChanged: (dynamic value) {
                              setState(() {
                                print(value);
                                if (value == "OTHER(टाइप करे)") {
                                  print("Hello");
                                  isenable = true;
                                  professionddvalue = value;
                                }
                                professionddvalue = value;
                              });
                            },
                          ),
                        ), //DROPDOWN FOR PROFESSION
                        SizedBox(height: 10.0),
                        /* DropdownButton<String>(
                              isExpanded: true,
                              value:qualificationddval,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 10,
                              onChanged: (String newValue){
                                setState(() {
                                  qualificationddval=newValue;
                                });
                              },
                              items:<String>[
                                "Qualification",
                                "NOT APPLICABLE",
                                "MA",
                                "Intermediate",
                                "MBA",
                                "B Tech",
                                "B COM",
                                "M COM",
                                "B E",
                                "HIGHER SEC",
                                "B A",
                                "MBBS",
                                "B SC",
                                "MIDDILE",
                                "BCA",
                                "BBA",
                                "MCA",
                                "GRADUATION",
                                "POST GRADUATION",
                                "CA",
                                "LLB",
                                "DIPLOMA",
                                "M TECH",
                                "BAMS",
                                "M PHARMA",
                                "B PHARMA",
                                "Other"

                              ]
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value:value,
                                  child:Text(value),
                                );
                              }).toList(),
                            ),*/
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 20,
                            elevation: 10,
                            value: fatherprofessionddvalue,
                            hint: Text("पिता का व्यवसाय (Fathers Profession)"),
                            items:
                            !isfenable
                                ? fdata.map((list) {
                              return DropdownMenuItem(
                                child: Text(list),
                                value: list,
                              );
                            }).toList()
                                : fdata.map((list) {
                              return DropdownMenuItem(
                                value: list,
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                  showCursor: true,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    labelText: 'पिता का व्यवसाय टाइप करे',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  controller: _fatherprof,
                                ),
                              );
                            }).toList(),

                            onChanged: (dynamic value) {
                              setState(() {
                                print(value);
                                if (value == "Other(टाइप करे)") {
                                  isfenable = true;
                                  fatherprofessionddvalue = value;
                                }
                                fatherprofessionddvalue = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),

                            iconSize: 20,
                            elevation: 10,
                            value: qualificationddval,
                            hint: Text("Qualification"),
                            items:
                                !isqenable
                                    ? dataq.map((list) {
                                      return DropdownMenuItem(
                                        child: Text(list),
                                        value: list,
                                      );
                                    }).toList()
                                    : dataq.map((list) {
                                      return DropdownMenuItem(
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                          showCursor: true,
                                          autofocus: true,

                                          decoration: InputDecoration(
                                            labelText: 'क्वालिफिकेशन टाइप कीजिये ',
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          controller: _otherqual,
                                        ),
                                        value: list,
                                      );
                                    }).toList(),

                            onChanged: (dynamic value) {
                              setState(() {
                                print(value);
                                if (value == "Other(टाइप करे)") {
                                  isqenable = true;
                                  qualificationddval = value;
                                }
                                qualificationddval = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        /* DropdownButton<String>(
                              isExpanded: true,
                              value:designddvalue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 10,
                              onChanged: (String newValue){
                                setState(() {
                                  designddvalue=newValue;
                                });
                              },
                              items:<String>[
                                "Designation",
                                "NOT APPLICABLE",
                                "SOFTWARE ENGINNER",
                                "SUPERVISOR",
                                "CONSULTANT",
                                "ASSISTANT MANAGER",
                                "ACCOUNTANT",
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
                                "LEUTINENT",
                                "ADVOCATE",
                                "ANALYST",
                                "PLANNER",
                                "DEVELOPER",
                                "OBSERVER",
                                "OFFICER",
                                "SCIENTIST",
                                "STENO",
                                "SURVEYOR",
                                "DIRECTOR"

                              ]
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value:value,
                                  child:Text(value),
                                );
                              }).toList(),
                            ),*/
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 20,
                            elevation: 10,
                            value: designddvalue,
                            hint: Text("Designation"),
                            items:
                                !isdenable
                                    ? datad.map((list) {
                                      return DropdownMenuItem(
                                        child: Text(list),
                                        value: list,
                                      );
                                    }).toList()
                                    : datad.map((list) {
                                      return DropdownMenuItem(
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                          showCursor: true,
                                          autofocus: true,

                                          decoration: InputDecoration(
                                            labelText: 'पद टाइप कीजिये ',
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          controller: _otherdesig,
                                        ),
                                        value: list,
                                      );
                                    }).toList(),

                            onChanged: (dynamic value) {
                              setState(() {
                                print(value);
                                if (value == "Other(टाइप करे)") {
                                  isdenable = true;
                                  designddvalue = value;
                                }
                                designddvalue = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _nameoforg,
                          decoration: InputDecoration(
                            labelText: 'कार्यरत संस्था (Organisation)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),

                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _workcity,
                          decoration: InputDecoration(
                            labelText: 'कार्य सिटी (City)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownvalue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 10,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                            items:
                                <String>[
                                  "स्वयं का गोत्र",
                                  "अगरैया",
                                  "उचाड़िया",
                                  "उन्नेरिया",
                                  "कठेरिया",
                                  "कोटिया",
                                  "कपरिया",
                                  "कोलानायक",
                                  "कुहेले",
                                  "गढ़ा के शाह",
                                  "गन्धी",
                                  "घीया",
                                  "चड़ोसिया",
                                  "चिकनिया",
                                  "चौरिया",
                                  "जागड़ा",
                                  "झारी के पाण्डिया",
                                  "ठकुरिया",
                                  "ढिलवारी",
                                  "दनगसिया",
                                  "धांगा",
                                  "नायक",
                                  "नाहरमूढा",
                                  "पचगइयां",
                                  "पचमेहरिया",
                                  "पाण्डिया",
                                  "पुनविया",
                                  "पुरिया",
                                  "पूणारावत",
                                  "बघोरिया",
                                  "बजाज",
                                  "बरैठा",
                                  "भण्डारी",
                                  "मिड़ाखुरिया",
                                  "मूंजी",
                                  "मेंहतिया",
                                  "महोरिया",
                                  "रनपुरिया",
                                  "रावत",
                                  "लखेश्वरी",
                                  "लोहरिया",
                                  "साहबजाज",
                                  "सुथनिया",
                                  "संडा",
                                  "साहुला",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownvalue1,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 10,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue1 = newValue!;
                              });
                            },
                            items:
                                <String>[
                                  "मामा का गोत्र",
                                  "अगरैया",
                                  "उचाड़िया",
                                  "उन्नेरिया",
                                  "कठेरिया",
                                  "कोटिया",
                                  "कपरिया",
                                  "कोलानायक",
                                  "कुहेले",
                                  "गढ़ा के शाह",
                                  "गन्धी",
                                  "घीया",
                                  "चड़ोसिया",
                                  "चिकनिया",
                                  "चौरिया",
                                  "जागड़ा",
                                  "झारी के पाण्डिया",
                                  "ठकुरिया",
                                  "ढिलवारी",
                                  "दनगसिया",
                                  "धांगा",
                                  "नायक",
                                  "नाहरमूढा",
                                  "पचगइयां",
                                  "पचमेहरिया",
                                  "पाण्डिया",
                                  "पुनविया",
                                  "पुरिया",
                                  "पूणारावत",
                                  "बघोरिया",
                                  "बजाज",
                                  "बरैठा",
                                  "भण्डारी",
                                  "मिड़ाखुरिया",
                                  "मूंजी",
                                  "मेंहतिया",
                                  "महोरिया",
                                  "रनपुरिया",
                                  "रावत",
                                  "लखेश्वरी",
                                  "लोहरिया",
                                  "साहबजाज",
                                  "सुथनिया",
                                  "संडा",
                                  "साहुला",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.characters,
                          controller: _mobilenumber1,
                          decoration: InputDecoration(
                            labelText: 'माताजी/पिताजी का मोबाइल नंबर',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),
                        TextField(
                          textCapitalization: TextCapitalization.characters,
                          controller: _housenumber,
                          decoration: InputDecoration(
                            labelText: 'मकान नंबर (HouseNumber)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _street,
                          decoration: InputDecoration(
                            labelText: 'गली/मोहल्ला (Street)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        /*TextFormField(
                              keyboardType:TextInputType.text,
                              textCapitalization: TextCapitalization.characters,
                              controller: _city,
                              decoration: InputDecoration(
                                  labelText: 'नगर/जिला (City)',
                                  labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                            ),*/
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _village,
                          decoration: InputDecoration(
                            labelText: 'गांव/शहर (VIllage)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 20,
                            elevation: 10,
                            value: citydropdownvalue,
                            hint: Text("City"),
                            items:
                                !isenable
                                    ? dataci.map((list) {
                                      return DropdownMenuItem(
                                        child: Text(list),
                                        value: list,
                                      );
                                    }).toList()
                                    : dataci.map((list) {
                                      return DropdownMenuItem(
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                          showCursor: true,
                                          autofocus: true,

                                          decoration: InputDecoration(
                                            labelText: 'टाइप कीजिये ',
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          controller: _city,
                                        ),
                                        value: list,
                                      );
                                    }).toList(),

                            onChanged: (dynamic value) {
                              setState(() {
                                if (value == "Other(टाइप करे)") {
                                  isenable = true;
                                  citydropdownvalue = value;
                                }
                                citydropdownvalue = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: statedropdown,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 10,
                            onChanged: (String? newValue) {
                              setState(() {
                                statedropdown = newValue!;
                              });
                            },
                            items:
                            <String>[
                              "राज्य (State)",
                              "आंध्र प्रदेश",
                              "अरुणाचल प्रदेश",
                              "असम",
                              "बिहार",
                              "छत्तीसगढ़",
                              "गोवा",
                              "गुजरात",
                              "हरियाणा",
                              "हिमाचल प्रदेश",
                              "झारखंड",
                              "कर्नाटक",
                              "केरल",
                              "मध्य प्रदेश",
                              "महाराष्ट्र",
                              "मणिपुर",
                              "मेघालय",
                              "मिज़ोरम",
                              "नागालैंड",
                              "ओडिशा",
                              "पंजाब",
                              "राजस्थान",
                              "सिक्किम",
                              "तमिलनाडु",
                              "तेलंगाना",
                              "त्रिपुरा",
                              "उत्तर प्रदेश",
                              "उत्तराखंड",
                              "पश्चिम बंगाल"

                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _country,
                          decoration: InputDecoration(
                            labelText: 'देश (Country)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // TextField(
                        //   keyboardType: TextInputType.text,
                        //   textCapitalization: TextCapitalization.characters,
                        //   controller: _state,
                        //   decoration: InputDecoration(
                        //     labelText: 'राज्य (State)',
                        //     labelStyle: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14,
                        //     ),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(height: 10.0),

                        TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          controller: _namepfcp,
                          decoration: InputDecoration(
                            labelText: 'संपर्क सूत्र का नाम Contact Person',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.characters,
                          controller: _mobilenumber2,
                          decoration: InputDecoration(
                            labelText: 'मोबाईल नंबर (Mobile No.)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Container(
              height: 20,
              child: Text(
                "डाटा अपलोड करते हुए मैं सभी ",
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            Container(
              child: InkWell(
                child: Text(
                  "नियम, शर्ते व प्राइवेसी पालिसी",
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 14),
                ),
                onTap: () => Get.toNamed(AppRoute.privacypolicy),
              ),
            ),

            Container(
              child: Text(
                "मानता हूँ  ",
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),

            InkWell(
              onTap: () async {
                setState(() {
                  bartitle = 'Uploading';
                });
                ContactInfo newcontact = ContactInfo(
                  MobileNumber1: gettextvalue(_mobilenumber1.text),
                  MobileNumber2: gettextvalue(_mobilenumber2.text),
                  HouseNumber: gettextvalue(_housenumber.text),
                  Street: gettextvalue(_street.text),
                  City: citydropdownvalue,
                  VillageLocality: gettextvalue(_village.text),
                  State: gettextvalue(statedropdown.toString()),
                  Country: gettextvalue(_country.text),
                  Pincode: "NA",
                  NameOfCP: gettextvalue(_namepfcp.text),
                );
                PersonalProfilewithc newp = PersonalProfilewithc(
                  Gender: getgender(genderddvalue.toString()),
                  Manglik: getmanglikstatus1(Manglikddvalue.toString()),
                  Sno: "APPS",
                  Name: gettextvalue(_name.text),
                  Father: gettextvalue(_father.text),
                  FatherProfession: gettextvalue(fatherprofessionddvalue),
                  Sister: gettextvalue(_sister.text),
                  Brother: gettextvalue(_brother.text),
                  Mother: gettextvalue(_mother.text),
                  Age: gettextvalue(
                    getageondate(dayvalue + "/" + monthvalue + "/" + yearvalue),
                  ),
                  DateOfBirth: getdatetextvalue(
                    dayvalue + "/" + monthvalue + "/" + yearvalue,
                  ),
                  BirthTime: gettextvalue(_birthTime.text) + ampm,
                  BirthPlace: gettextvalue(_birthplace.text),
                  Height: gettextvalue(ftddvalue)+"."+gettextvalue(inch) + " Feet",

                  Profession: chektextvalue(
                    professionddvalue.toString(),
                    "Prof",
                  ),
                  Qualification: chektextvalue(
                    qualificationddval.toString(),
                    "Qual",
                  ),
                  Designation: chektextvalue(designddvalue.toString(), "Desig"),
                  NameOfOrganisation: gettextvalue(_nameoforg.text),
                  WorkCity: gettextvalue(_workcity.text),
                  GotraFather: getgotraninenglish(dropdownvalue.toString()),
                  GotraMother: getgotraninenglish(dropdownvalue1.toString()),
                  ContactInfoobj: newcontact,
                  Verified: 0,
                  Married: '0',
                  Income: incomeDdValue,
                  Special: 0,
                  Quality: gettextvalue(_special.text),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addimage(newp)),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "फोटो अपलोड करे ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  getgotraninenglish(String dropdownvalue1) {
    switch (dropdownvalue1) {
      case "अगरैया":
        return "AGRAIYA";

      case "उचाड़िया":
        return "UCHARIYA";

      case "उन्नेरिया":
        return "UNNERIYA";

      case "कठेरिया":
        return "KATHERIYA";

      case "कपरिया":
        return "KAPRIYA";

      case "कोटिया":
        return "KOTIYA";

      case "कोलानायक":
        return "KOLANAYAK";

      case "कुहेले":
        return "KUHELE";

      case "गढ़ा के शाह":
        return "GADA KE SHAH";

      case "गन्धी":
        return "GANDHI";

      case "घीया":
        return "GHIYA";

      case "चड़ोसिया":
        return "CHADOSIYA";

      case "चिकनिया":
        return "CHIKANIYA";

      case "चौरिया":
        return "CHORIYA";

      case "जागड़ा":
        return "JANGDA";

      case "झारी के पाण्डिया":
        return "JHARE KE PANDYA";
      case "ठकुरिया":
        return "THAKURIYA";

      case "ढिलवारी":
        return "DHILWARI";

      case "दनगसिया":
        return "DANGASIYA";

      case "धांगा":
        return "DHANGA";

      case "नायक":
        return "NAYAK";

      case "नाहरमूढा":
        return "NAHARMOODHA";

      case "पचगइयां":
        return "PACHGAIYA";

      case "पचमेहरिया":
        return "PACHMEHARIYA";

      case "पाण्डिया":
        return "PANDIYA";

      case "पुनविया":
        return "PUNVIYA";

      case "पुरिया":
        return "PURIYA";

      case "पूणारावत":
        return "PUNARAWAT";

      case "बघोरिया":
        return "BAGHORIYA";

      case "बजाज":
        return "BAJAJ";

      case "बरैठा":
        return "BARETHA";

      case "भण्डारी":
        return "BHANDARI";

      case "मिड़ाखुरिया":
        return "MIDAKHURIYA";

      case "मूंजी":
        return "MOONJI";

      case "मेंहतिया":
        return "MAHTIYA";

      case "महोरिया":
        return "MOHARIYA";

      case "रनपुरिया":
        return "RANPURIYA";

      case "रावत":
        return "RAWAT";

      case "लखेश्वरी":
        return "LAKHESHWARI";

      case "लोहरिया":
        return "LOHARIYA";

      case "साहबजाज":
        return "SHAHBAJAJ";

      case "सुथनिया":
        return "SUTHANIYA";

      case "संडा":
        return "SANDA";

      case "साहुला":
        return "SAHULA";

      default:
        return "NA";
    }
  }

  getgender(String string) {
    if (string == 'वर') {
      return 'M';
    } else {
      return 'F';
    }
  }

  getSno(String text) {
    if (text == "") {
      return ("NA");
    } else {
      return text.substring(0, 2);
    }
  }

  chektextvalue(String string, String ddname) {
    switch (ddname) {
      case "Prof":
        if (string == "Profession") {
          return "NA";
        } else if (string == "Other(टाइप करे)") {
          return _otherprof.text;
        } else {
          return string;
        }

      case "Qual":
        if (string == "Qualfication") {
          return "NA";
        } else if (string == "Other(टाइप करे)") {
          return _otherqual.text;
        } else {
          return string;
        }

      case "Desig":
        if (string == "Designation") {
          return "NA";
        } else if (string == "Other(टाइप करे)") {
          return _otherdesig.text;
        } else {
          return string;
        }
    }
  }

  Widget _appBar() {
    return Container(
      height: 70,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            _menuIcon(),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "नयी प्रोफाइल बनाइये",
                  style: GoogleFonts.dancingScript(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Builder _menuIcon() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          iconSize: 0,
          icon: SvgPicture.asset(menuIcon, color: kPrimaryColor),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    );
  }

  getyearitems() {
    final items = DateTime.now().year;

    print(items);
    List<String> years = ["YYYY"];
    for (int i = items - 60; i <= items; i++) {
      years.add(i.toString());
    }

    return years;
  }

  getageondate(String date) {
    try {
      final df = new DateFormat('dd/MMM/yyyy');
      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.parse(date);
      //print(DateTime.parse(personalProfilewithc.DateOfBirth!));
      return calculateAge(outputDate);
    } catch (err) {
      print(err);
      DialogHelper.instance.showErrorDialog(
        title: "Date Error",
        description: "Select vaild date...",
      );
    }
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  getdatetextvalue(String s) {
    if (s == "DD/MM/YYYY") {
      return "NA";
    } else {
      return s;
    }
  }
}

getmanglikstatus1(String manglikstatus) {
  if (manglikstatus == "नॉन मांगलिक") {
    return "0";
  } else if (manglikstatus == "मांगलिक") {
    return "1";
  } else if (manglikstatus == 'आंशिक मांगलिक') {
    return "2";
  } else {
    return "0";
  }
}

gettextvalue(String text) {
  print(text);
  if (text == "") {
    return "NA";
  } else {
    print(text);
    return text;
  }
}
