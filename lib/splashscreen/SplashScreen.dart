import 'dart:async';
import 'package:aprjnew/Constants/routedart.dart';
import 'package:aprjnew/splashscreen/Welcome.dart';
import 'package:aprjnew/user/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/size.dart';
import '../GlobalUtilities/Controllers/app_controller.dart';

class SpScreen extends StatefulWidget {
  @override
  _SpScreeState createState() => _SpScreeState();
}

class _SpScreeState extends State<SpScreen> {
  bool _isInitialized = false;
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      ResponsiveSize.init(context); // ✅ Safe here
      _isInitialized = true;
      init(); // call the rest of your logic
    }
  }

  Future<void> init() async {
    Get.find<AppController>();
    //ResponsiveSize.init(context);
    //NavigationIndex.init(0);
    Future.delayed(const Duration(seconds: 2));
    // finish(context);
    getloginstatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/spback.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 150.0),
              Center(
                child: Text(
                  "जैसवाल जैन परिणय ",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "जैसवाल जैन समाज",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 30.0),
              Center(
                child: Text(
                  "Jaiswal Jain Parinay",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Jaiswal Jain Samaj",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, MediaQuery.of(context).size.height * 0.45),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      "अविवाहित प्रतिभाएं प्रस्तुति समूह",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getloginstatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;

    if (token == 0) {
      Get.offAndToNamed(AppRoute.login);
    } else {
      Get.offAndToNamed(AppRoute.welcome);
    }
  }
}
