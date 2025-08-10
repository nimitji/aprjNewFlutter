import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/routedart.dart';


class WelcomeScreen extends StatefulWidget{
  @override
  _WelcomeScreeState createState()=>_WelcomeScreeState();

}

class _WelcomeScreeState extends State<WelcomeScreen>{

  @override
  void initState() {
    super.initState();
    init();

  }
  Future<void> init() async {

    await Future.delayed(const Duration(seconds: 2));
    // finish(context);
    Get.offAndToNamed(AppRoute.homescreen);

  }
  @override
  Widget build(BuildContext context)
  {

    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
            Container(height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                  image:DecorationImage(
                    image:AssetImage("image/9.jpg"),
                    fit:BoxFit.fill,

                  )
              ),
            ),

           /* Transform.translate(offset: Offset(0.0, MediaQuery.of(context).size.height*0.45),
                      child: Center(
                          child:Text("यह App केवल उपरोचियाँ जैसवाल जैन समाज के सदस्यों के लिए है",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                        ),)*/





          ],
        ),
      ),
    );
  }



}





