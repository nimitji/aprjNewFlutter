import 'package:aprjnew/Constants/app_color.dart';
import 'package:aprjnew/classes/feedbackclass.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Constants/routedart.dart';
import '../home/HomeScreen.dart';

class Feedbackbyuser extends StatefulWidget {
  @override
  _Feedbackstate createState() => _Feedbackstate();
}

class _Feedbackstate extends State<Feedbackbyuser> {
  final TextEditingController _Feedback = TextEditingController();
  bool issaving = false;

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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Text(
                    "आपका फीडबैक, सुझाव या सराहना हमारे लिए महत्वपूर्ण है,कृपया यहाँ लिखकर भेजे:\n" +
                        "Your feedback is important for us, please write here and send",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 10)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPrimaryColor),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'यहाँ लिखकर भेजे (Type here) ',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      maxLines: 10,
                      controller: _Feedback,
                      style: TextStyle(fontSize: 25),
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
            SizedBox(height: 20),

            InkWell(
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
                    "हमे भेजे (Send Us)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              onTap: () async {
                setState(() {
                  issaving = true;
                });

                Feedbackbu newfeed = new Feedbackbu(feedback: _Feedback.text);

                String result = await savefeedback(newfeed);

                if (result == "200") {
                  getdialog(
                    "200",
                    "धन्यवाद",
                    "आपका फीडबैक/सुझाव/प्रशंशापत्र हमारे सिस्टम में सेव हो गया है ",
                  );
                  setState(() {
                    issaving = false;
                  });
                } else {
                  getdialog(
                    result.toString(),
                    "कार्य पूरा नहीं हुआ ",
                    "तकनिकी वजह से आपका फीडबैक/सुझाव/प्रशंशापत्र ऐड नहीं हुआ है",
                  );
                  setState(() {
                    issaving = false;
                  });
                }
              },
            ),

            SizedBox(height: 20),
          ],
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
          elevation: 24,
        );
      },
    );
  }
}
