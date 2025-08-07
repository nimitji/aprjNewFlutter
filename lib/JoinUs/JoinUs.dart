import 'package:flutter/material.dart';

class Joinus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("हमसे जुड़िये"),),
      backgroundColor: Colors.white,
      body:
      getlist(),
    );
  }


  getlist() {

    return ListView(
      children: [
        Column(
          children: [
            Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Card(child:Column(
                children: [
                  Center(
                    child:Text("हमारे विस्तृत एवं सिक्योर्ड डेटाबेस में अपनी या अपने किसी भी सगे संबधियो की प्रोफाइल जोड़ने के लिए आप हमे निम्नलिखित सूत्रों द्वारा संपर्क कर सकते है",style: TextStyle(fontSize: 25),),
                  ),



                ],
              )


              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Card(child:Column(
                children: [
                  Center(
                    child:Text("श्री रूपेश जैन, उत्तम नगर (दिल्ली)",style: TextStyle(fontSize: 25),),
                  ),

                  Center(
                    child:Text("Mobile: 9999977294",style: TextStyle(fontSize: 25),),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child:Text("Email:",style: TextStyle(fontSize: 25),),
                  ),
                  Center(
                    child:Text("rupesh.jain.delhi@gmail.com",style: TextStyle(fontSize: 20),),
                  ),
                  Center(
                    child:Text("jaiswaljainparinay@gmail.com",style: TextStyle(fontSize: 20),),
                  ),



                ],
              )


              ),
            ),









          ],
        ),
      ],
    );
  }



  String formatString(String designation) {
    if (designation != "NA") {
      if (designation.length < 17) {
        return designation;
      }
      else {
        return designation.substring(0, 17);
      }
    }
    else {
      return "Not Available";
    }
  }

  String formatname(String name) {
    if (name.length < 17) {
      return name;
    }
    else {
      return name.substring(0, 17) +'\n'+name.substring(17,name.length);
    }
  }



}