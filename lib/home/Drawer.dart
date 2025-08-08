import 'package:aprjnew/Constants/app_color.dart';
import 'package:aprjnew/Constants/size.dart';
import 'package:aprjnew/Information/information.dart';
import 'package:aprjnew/home/components/banner.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../profiles/Profiles.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(height: 80, color: kPrimaryColor),

            Container(
              child: ListView(
                children: [
                  ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  getVerticalSpace(50),
                  /*   ExpansionTile(
                  leading: Icon(Icons.photo_album),
                  title: Text(
                    "वधु (Bride)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                          "मांगलिक (Manglik)",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfileList()));
                        }),
                    Divider(
                      thickness: 1.5,
                    ),
                    ListTile(

                        title: Text(
                          "नॉन मांगलिक (Non-Manglik)",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Profiles("NM","F","नॉन मांगलिक वधु/Non-Manglik Brides")));
                        }),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.photo_album),
                  title: Text(
                    "वर (Grooms)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                          "मांगलिक (Manglik)",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Profiles("M","M","मांगलिक वर/Manglik Groom")));
                        }),
                    Divider(
                      thickness: 1.5,
                    ),
                    ListTile(

                        title: Text(
                          "नॉन मांगलिक (Non-Manglik)",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Profiles("NM","M",'नॉन मांगलिक वर/Non-Manglik Groom')));
                        }),
                  ],
                ),*/
                  Divider(thickness: 1.5),

                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "जानकारियां (About Us)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appslist()),
                      );
                    },
                  ),
                  Divider(thickness: 1.5),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "जैसवाल एक परिचय ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Intro()),
                      );
                    },
                  ),
                  Divider(thickness: 1.5),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "सहायता (Help)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appslist()),
                      );
                    },
                  ),
                  Divider(thickness: 1.5),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "वैवाहिक जानकारियां",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MarriageInfo()),
                      );
                    },
                  ),
                  Divider(thickness: 1.5),

                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "संपर्क करें (Contact Us) ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminList()),
                      );
                    },
                  ),
                  Divider(thickness: 1.5),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text('Do you want to logout?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Yes'),
                                onPressed: () async {
                                  int res = await clearsharedprefs();
                                  if (res == 1) {
                                    Navigator.pop(context);
                                    Navigator.of(
                                      context,
                                    ).pushNamedAndRemoveUntil(
                                      '/Login',
                                      (route) => false,
                                    );
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Divider(thickness: 1.5),

                  /*ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "सहायता  (Help) ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.pop(context);

                    }),
                Divider(
                  thickness: 1.5,
                ),*/
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "अविवाहित प्रतिभाए प्रस्तुति समूह",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Center(
                          child: Text(
                            "उपरोचिया जैसवाल जैन समाज",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),

                  AdBannerPanel(),
                  SizedBox(height: 30),
                  Text("version 2.1.0/2022"),
                  SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Designed, developed and maintained by",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: InkWell(
                              child: Text(
                                "NPRSSPL",
                                style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> clearsharedprefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("phone");
    return 1;
  }
}
