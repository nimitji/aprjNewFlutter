import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/profiles/IndividualProfile.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import '../Constants/app_color.dart';
import '../Constants/assets_path.dart';
import '../Constants/routedart.dart';
import '../Constants/size.dart';
import '../GlobalUtilities/Controllers/profileController.dart';
import '../home/components/category.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController _profile = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_profile.title.value)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(
                    () => Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, 70),
                          child: SizedBox(
                            height: ResponsiveSize.screenHeight,
                            width: ResponsiveSize.screenWidth,
                            child: ListView.builder(
                              itemCount: _profile.Nselected.length,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(6),
                                      ),
                                      child: FadeInImage.memoryNetwork(
                                        image:
                                            _profile
                                                .Nselected[index]
                                                .PhotoLink1 ??
                                            "",
                                        fit: BoxFit.fitHeight,
                                        placeholder: kTransparentImage,
                                        imageErrorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Image.asset(
                                            'image/na.jpg',
                                            fit: BoxFit.fitHeight,
                                          );
                                        },
                                      ),
                                    ),
                                    // _profile.Nselected[index].PhotoLink1 !=
                                    //         "NA"
                                    //     ? Image(
                                    //       image: NetworkImage(
                                    //         _profile
                                    //             .Nselected[index]
                                    //             .PhotoLink1!,
                                    //       ),
                                    //     )
                                    //     : Image(
                                    //       image: AssetImage("image/na.jpg"),
                                    //     ),
                                    title: getageondate(
                                      _profile.Nselected[index],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _profile.Nselected[index].Gender == "M"
                                            ? Text(
                                              "(सुपुत्र " +
                                                  _profile
                                                      .Nselected[index]
                                                      .Mother! +
                                                  " एवं " +
                                                  _profile
                                                      .Nselected[index]
                                                      .Father! +
                                                  ")",
                                            )
                                            : Text(
                                              "(सुपुत्री " +
                                                  _profile
                                                      .Nselected[index]
                                                      .Mother! +
                                                  " एवं " +
                                                  _profile
                                                      .Nselected[index]
                                                      .Father! +
                                                  ")",
                                            ),
                                        Row(
                                          children: [
                                            Text(
                                              _profile
                                                  .Nselected[index]
                                                  .BirthPlace!,
                                            ),
                                            Text("/"),
                                            _profile
                                                        .Nselected[index]
                                                        .ContactInfoobj !=
                                                    null
                                                ? Text(
                                                  _profile
                                                      .Nselected[index]
                                                      .ContactInfoobj!
                                                      .City!,
                                                )
                                                : Text("NA"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(Icons.navigate_next),
                                    onTap: () async {
                                      Get.toNamed(
                                        AppRoute.individualprofile,
                                        arguments: "$index",
                                      );
                                      await _profile.getindividualprofiles(
                                        id: _profile.Nselected[index].id,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        getVerticalSpace(100),
                      ],
                    ),
                  ),
                  Obx(
                    () => ExpansionTile(
                      initiallyExpanded: _profile.expandedfiter.value,
                      title: Text(
                        "फ़िल्टर द्वारा ढूंढ़ने के लिए यहाँ दबाएं ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(Icons.filter_alt),
                      trailing: Icon(
                        Icons.arrow_drop_down_circle,
                        size: 40,
                        color: Colors.grey,
                      ),
                      collapsedBackgroundColor: kshade5,
                      expandedAlignment: Alignment.center,
                      key: GlobalKey(),
                      children: [Category()],
                    ),
                  ),

                  //_profile.showcat.value?Category():Container(),
                ],
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  getlist() {
    ProfileController _profile = Get.find();
  }

  fetchImage(String? photoLink1) {
    if (photoLink1 == "NA") {
      return "https://nprservices.in/catalogue/APRJ/notavail.png";
    } else
      return photoLink1;
  }

  String? formatString(String? designation) {
    if (designation != "NA") {
      if (designation!.length < 25) {
        return designation;
      } else {
        return designation.substring(0, 25);
      }
    } else {
      return "Not Available";
    }
  }

  String formatname(String name) {
    if (name.length < 13) {
      return name;
    } else {
      return name.substring(0, 13) + '..';
    }
  }

  String getgender() {
    ProfileController _profile = Get.find();
    if (_profile.Nselected == "F") {
      return "Female";
    } else {
      return "Male";
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
                  "अविवाहित प्रतिभाएं प्रस्तुति समूह",
                  style: GoogleFonts.dancingScript(
                    fontSize: 20.0,
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
          icon: SvgPicture.asset(menuIcon, color: Colors.red),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    );
  }

  getageondate(PersonalProfilewithc personalProfilewithc) {
    if (personalProfilewithc.DateOfBirth! != "NA") {
      var outputFormat = DateFormat('dd/MM/yyyy');
      print("Hello" + personalProfilewithc.DateOfBirth!);
      print("Hello" + personalProfilewithc.Name!);
      print("Hello" + personalProfilewithc.Father!);
      var outputDate = outputFormat.parse(personalProfilewithc.DateOfBirth!);

      return Text(
        personalProfilewithc.Name! + " (" + calculateAge(outputDate) + " वर्ष)",
      );
    } else {
      return Text(personalProfilewithc.Name! + " (NA वर्ष)");
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
}

class Profiles extends StatefulWidget {
  final String manglikstatus, gender, title;
  Profiles(this.manglikstatus, this.gender, this.title);

  @override
  _ProfilesState createState() => _ProfilesState(manglikstatus, gender, title);
}

class _ProfilesState extends State<Profiles> {
  bool issearching = false;
  List<PersonalProfilewithc>? profiles = [];
  List<PersonalProfilewithc> fileredprofiles = [];
  final String manglikstatus, gender, title;
  String? qualification = "NA";
  String? city = "NA";
  String? profession = "NA";
  String? FAge = '18';
  String? tAge = '40';
  _ProfilesState(this.manglikstatus, this.gender, this.title);

  void _filtername(value, index) {
    setState(() {
      switch (index) {
        case 1:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains("doctor") ||
                        profiles.Profession!.toLowerCase().contains(
                          "medical",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "doctor",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "medical",
                        ) ||
                        profiles.Designation!.toLowerCase().contains("md") ||
                        profiles.Designation!.toLowerCase().contains(
                          "dentist",
                        ) ||
                        profiles.Qualification!.toLowerCase().contains(
                          "mbbs",
                        ) ||
                        profiles.Qualification!.toLowerCase().contains(
                          "pharma",
                        ) ||
                        profiles.Qualification!.toLowerCase().contains(
                          "bhms",
                        ) ||
                        profiles.Qualification!.toLowerCase().contains("bds"),
                  )
                  .toList();
          break;
        case 5:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains(
                          "engineer",
                        ) ||
                        profiles.Qualification!.toLowerCase().contains(
                          "engineer",
                        ) ||
                        profiles.Qualification!.toLowerCase().endsWith("tech"),
                  )
                  .toList();
          break;
        case 2:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Qualification!.toLowerCase().startsWith(
                          "ca",
                        ) ||
                        profiles.Qualification!.toLowerCase().startsWith(
                          "cs",
                        ) ||
                        profiles.Designation!.toLowerCase().startsWith("ca") ||
                        profiles.Designation!.toLowerCase().startsWith("cs") ||
                        profiles.Profession!.toLowerCase().startsWith("ca") ||
                        profiles.Profession!.toLowerCase().startsWith("cs"),
                  )
                  .toList();
          break;
        case 3:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains("business"),
                  )
                  .toList();
          break;
        case 4:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Designation!.toLowerCase().contains(
                          "teacher",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "lecturer",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "professor",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "tution",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "coaching",
                        ) ||
                        profiles.Designation!.toLowerCase().contains(
                          "instructor",
                        ) ||
                        profiles.Qualification!.toLowerCase().endsWith("ed") ||
                        profiles.Profession!.toLowerCase().contains(
                          "teacher",
                        ) ||
                        profiles.Profession!.toLowerCase().contains(
                          "lecturer",
                        ) ||
                        profiles.Profession!.toLowerCase().contains("tution") ||
                        profiles.Profession!.toLowerCase().contains("coaching"),
                  )
                  .toList();
          break;

        case 13:
          print(tAge! + " " + FAge!);
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        int.parse(profiles.Age!) >= int.parse(FAge!) &&
                        int.parse(profiles.Age!) <= int.parse(tAge!),
                  )
                  .toList();
          break;
        case 6:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains("govt"),
                  )
                  .toList();
          break;
        case 7:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains("private"),
                  )
                  .toList();
          break;
        case 8:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Qualification!.toLowerCase().endsWith('it') ||
                        profiles.Qualification!.toLowerCase().contains(
                          "software",
                        ) ||
                        profiles.Qualification!.toLowerCase().contains("bca") ||
                        profiles.Qualification!.toLowerCase().contains("mca") ||
                        profiles.Profession!.toLowerCase().contains(
                          "software",
                        ) ||
                        profiles.Profession!.toLowerCase().contains("it") ||
                        profiles.Profession!.toLowerCase().contains(
                          "hardware",
                        ) ||
                        profiles.Profession!.toLowerCase().contains("bpo") ||
                        profiles.Profession!.toLowerCase().contains("tester"),
                  )
                  .toList();
          break;

        case 9:
          print(value);
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Qualification!.toLowerCase().contains("mba"),
                  )
                  .toList();
          break;
        case 10:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains(
                          "startup",
                        ) ||
                        profiles.Profession!.toLowerCase().contains(
                          "entrepreneur",
                        ),
                  )
                  .toList();
          break;
        case 11:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains("law") ||
                        profiles.Profession!.toLowerCase().contains("legal") ||
                        profiles.Qualification!.toLowerCase().contains("llb") ||
                        profiles.Qualification!.toLowerCase().contains("law") ||
                        profiles.Qualification!.toLowerCase().contains("llm") ||
                        profiles.Qualification!.toLowerCase().contains(
                          "advisor",
                        ) ||
                        profiles.Profession!.toLowerCase().startsWith(
                          "advocate",
                        ) ||
                        profiles.Profession!.toLowerCase().contains("lawyer"),
                  )
                  .toList();
          break;
        case 12:
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.toLowerCase().contains("pursuing"),
                  )
                  .toList();
          break;
        case 14:
          print(value);
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Qualification!.contains(value) ||
                        profiles.Qualification!.startsWith(value) ||
                        profiles.Qualification!.endsWith(value),
                  )
                  .toList();
          break;
        case 15:
          print(value);
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.Profession!.contains(value) ||
                        profiles.Profession!.startsWith(value) ||
                        profiles.Profession!.endsWith(value) ||
                        profiles.Designation!.contains(value) ||
                        profiles.Designation!.startsWith(value) ||
                        profiles.Designation!.endsWith(value),
                  )
                  .toList();
          break;
        case 16:
          print(value);
          if (value == "वंडील") {
            value = "BANDIL";
          } else if (value == "कोलारस") {
            value = "KOLARAS";
          }
          fileredprofiles =
              profiles!
                  .where(
                    (profiles) =>
                        profiles.BirthPlace!.contains(value) ||
                        profiles.BirthPlace!.startsWith(value) ||
                        profiles.BirthPlace!.endsWith(value),
                  )
                  .toList();
          break;
      }

      // print(fileredprofiles[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //appBar: AppBar(title: Text(title),),

      //  body:
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(0.0, 50),
            child: FutureBuilder(
              future: getquerywithc(manglikstatus, gender),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? _setState(snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),

          ExpansionTile(
            title: Text(
              "फ़िल्टर द्वारा ढूंढ़ने के लिए यहाँ दबाएं ",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(Icons.filter_alt),
            trailing: Icon(
              Icons.arrow_drop_down_circle,
              size: 40,
              color: Colors.grey,
            ),
            collapsedBackgroundColor: Colors.white,
            expandedAlignment: Alignment.center,
            key: GlobalKey(),
            children: [
              Container(
                color: Colors.white,
                height: 500,
                child: Column(
                  children: [
                    Container(child: tags(), padding: EdgeInsets.all(10)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("शहर (City)", style: TextStyle(fontSize: 20)),
                            SizedBox(height: 20),
                            Text(
                              "शिक्षा (Qualification)",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "व्यवसाय (Profession)",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            /*Container(width:220,

                                child:TextField(controller: _Name,
                                  style: TextStyle(fontSize: 20,color: Colors.purple),
                                 ),
                                decoration: BoxDecoration(color:Colors.white,
                                    borderRadius:BorderRadius.circular(10.0))
                        ),
                              SizedBox(height: 30,),
                              Container(width:220,

                                  child:TextField(controller: _FName,
                                    style: TextStyle(fontSize: 20,color: Colors.purple),
                                  ),
                                  decoration: BoxDecoration(color:Colors.white,
                                      borderRadius:BorderRadius.circular(10.0))
                              ),
                              SizedBox(height: 30,),*/
                            Container(
                              width: 220,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.purple),
                              ),

                              child: DropdownButton<String>(
                                isExpanded: true,

                                value: city,

                                hint: Text("", style: TextStyle(fontSize: 25)),
                                // icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 20,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    city = newValue;
                                    issearching = true;
                                    _filtername(newValue, 16);
                                  });
                                },
                                items:
                                    <String>[
                                      "NA",
                                      "अहमदाबाद",
                                      "सूरत",
                                      "अशोकनगर",
                                      "आगरा",
                                      "अकाझिरी",
                                      "अम्बाह",
                                      "अजमेर",
                                      "भोपाल",
                                      "वंडील",
                                      "धौलपुर",
                                      "डबरा",
                                      "दिल्ली",
                                      "ईसागढ़",
                                      "फ़िरोज़ाबाद",
                                      "गुना",
                                      "इंदौर",
                                      "उज्जैन",
                                      "झाँसी",
                                      "कोटा",
                                      "जयपुर",
                                      "कस्बाथाना",
                                      "करैरा",
                                      "कोलारस",
                                      "कांकरोली",
                                      "किसनगढ़",
                                      "कोलकाता",
                                      "मुरैना",
                                      "मनियां",
                                      "मकराना",
                                      "मुंबई",
                                      "मुरार",
                                      "ग्वालियर",
                                      "गोहद",
                                      "पोहरी",
                                      "नरवर",
                                      "राजाखेड़ा",
                                      "रन्नौद",
                                      "शिवपुरी",
                                      "बड़ोदरा",
                                      "बंगलोर",
                                      "पुणे",
                                      "गुरुग्राम",
                                      "ग़ाज़ियाबाद",
                                      "नॉएडा",
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
                            SizedBox(height: 5),
                            Container(
                              width: 220,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.purple),
                              ),

                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: qualification,

                                hint: Text("", style: TextStyle(fontSize: 25)),
                                // icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 20,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    qualification = newValue;
                                    issearching = true;
                                    _filtername(newValue, 14);
                                  });
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
                            SizedBox(height: 5),
                            Container(
                              width: 220,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.purple),
                              ),

                              child: DropdownButton<String>(
                                value: profession,
                                isExpanded: true,
                                hint: Text("", style: TextStyle(fontSize: 25)),
                                // icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 20,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    profession = newValue;
                                    issearching = true;
                                    _filtername(newValue, 15);
                                  });
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
                      ],
                    ),
                    Row(
                      children: [
                        Text("आयु से", style: TextStyle(fontSize: 20)),
                        SizedBox(width: 20),
                        Container(
                          width: 70,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.purple),
                          ),

                          child: DropdownButton<String>(
                            value: FAge,
                            //hint: Text("Age greater",style: TextStyle(fontSize: 25),),
                            // icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 20,
                            onChanged: (String? newValue) {
                              setState(() {
                                FAge = newValue;
                                issearching = true;
                                _filtername(FAge, 6);
                              });
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
                        Text("आयु तक", style: TextStyle(fontSize: 20)),
                        SizedBox(width: 20),
                        Container(
                          width: 70,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.purple),
                          ),

                          child: DropdownButton<String>(
                            value: tAge,

                            //hint: Text("Age greater",style: TextStyle(fontSize: 25),),
                            // icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 20,
                            onChanged: (String? newValue) {
                              setState(() {
                                tAge = newValue;
                                issearching = true;
                                _filtername(tAge, 6);
                              });
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  fetchprofile() {
    if (!issearching) {
      return profiles;
    }
    return fileredprofiles;
  }

  _setState(data) {
    profiles = data;
    return (ProfileList());
  }

  tags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Doctor", 1);
                    },
                    child: Text(
                      "Doctor",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.greenAccent,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("CA/CS", 2);
                    },
                    child: Text("CA", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.purple),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Business", 3);
                    },
                    child: Text(
                      "Business",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.brown,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Teacher", 4);
                    },
                    child: Text(
                      "Teacher",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.brown,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5),
            Column(
              children: [
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Engineer", 5);
                    },
                    child: Text(
                      "Engineer",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.purple),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Govt Job", 6);
                    },
                    child: Text(
                      "Govt Job",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.yellow,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Private Job", 7);
                    },
                    child: Text(
                      "Private Job",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.pink,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("IT", 8);
                    },
                    child: Text("IT", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.brown,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5),
            Column(
              children: [
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("MBA", 9);
                    },
                    child: Text("MBA", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Start-up", 10);
                    },
                    child: Text(
                      "Start-up",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Legal", 11);
                    },
                    child: Text("Legal", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      issearching = true;
                      _filtername("Pursuing", 12);
                    },
                    child: Text(
                      "Pursuing",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
