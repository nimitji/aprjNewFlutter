import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/classes/Updatereqclass.dart';

import 'package:aprjnew/utilities/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/app_color.dart';
import '../Constants/assets_path.dart';
import '../Constants/routedart.dart';
import '../home/HomeScreen.dart';

class UpdateInfo extends StatefulWidget {
  @override
  _updateinfostate createState() => _updateinfostate();
}

class _updateinfostate extends State<UpdateInfo> {
  final TextEditingController _editdetails = TextEditingController();
  final TextEditingController _Sno = TextEditingController();
  bool isloading = false;
  bool issaving = false;
  String name = "सर्च करने के बाद यहाँ प्रोफाइल नाम आएगा";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              _appBar(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0.0,
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      "आपकी प्रोफाइल में कोई भी परिवर्तन या बदलाव हुआ है, अथवा आपको अपनी प्रोफाइल में कोई त्रुटि सुधार करवाना है तो यहाँ पर सारे बदलाव लिख कर हमे भेजे ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0.0,
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      "If your profile has changed or you want to update any information or any correction is needed, \nthen please send us ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Divider(thickness: 1.0),

                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "आपकी प्रोफाइल की ID डाले (Profile ID)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kPrimaryColor),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                child: TextField(
                                  controller: _Sno,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    hintText: "Profile ID",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: InkWell(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(21),
                                    child: Icon(Icons.search),
                                  ),
                                ),
                                onTap: () async {
                                  String Name = await getnamewithsno(_Sno.text);
                                  setState(() {
                                    isloading = !isloading;

                                    if (Name == "Could not fetch the data")
                                      name = "इस ID से  कोई प्रोफाइल नहीं है ";
                                    else {
                                      name =
                                          Name +
                                          " की प्रोफाइल में अपडेट करना है";
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(name, style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.0),
                  SizedBox(height: 10),
                  Text(
                    "अपडेट करने के लिए डिटेल्स यहाँ डालियेे",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPrimaryColor),
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'यहाँ लिखकर भेजे (Type here) ',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      maxLines: 10,
                      controller: _editdetails,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 14,
                        ),
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
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),

                    child:
                        !issaving
                            ? Text(
                              "हमे भेजे (Send Us)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                            : CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),

                    onPressed: () async {
                      setState(() {
                        issaving = true;
                      });
                      PersonalProfilewithc newprofile =
                          new PersonalProfilewithc(Sno: _Sno.text);

                      Updatereq newfeed = new Updatereq(
                        profileID: newprofile,
                        Processed: 0,
                        RequestDetails: _editdetails.text,
                      );

                      String result = await saveupdatereq(newfeed);

                      if (result == "200") {
                        getdialog(
                          "200",
                          "धन्यवाद",
                          "आपकी रिक्वेस्ट हमारे सिस्टम में ऐड कर ली गई है, जिसपर जल्दी कार्यवाही होगी ",
                        );
                        setState(() {
                          issaving = false;
                        });
                      } else {
                        getdialog(
                          result.toString(),
                          "कार्य पूरा नहीं हुआ ",
                          "तकनिकी वजह से आपकी रिक्वेस्ट ऐड नहीं हुई है",
                        );
                        setState(() {
                          issaving = false;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  void getdialog(String s, String t, String u) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t, style: TextStyle(fontSize: 12)),
          content: Container(
            height: 60,
            width: 30,
            child: Text(u + " Code" + s),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Exit"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
          elevation: 24,
        );
      },
    );
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
          icon: SvgPicture.asset(menuIcon, color: kPrimaryColor),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    );
  }
}
