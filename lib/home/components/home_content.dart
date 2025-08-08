import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/app_color.dart';
import '../../Constants/assets_path.dart';
import '../../Constants/routedart.dart';
import '../../Constants/size.dart';
import '../../Constants/textStyles.dart';
import '../../addnewbyuser/addProfilebyuser.dart';
import '../../addnewbyuser/addprofilebyuserscreen.dart';
import '../../contact/feedback.dart';
import '../../contact/updatenote.dart';
import '../../profiles/Profiles.dart';
import '../../profiles/hot_products.dart';
import '../../search/Search.dart';
import '../../utilities/Helpers/shimmer_effect_loader.dart';
import 'banner.dart';
import 'category.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileController _profile = Get.find();
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;

    return RefreshIndicator(
      onRefresh: () => _profile.getprofiles(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _appBar(),
            MainBannerPanel(),
            getVerticalSpace(10),
            Obx(
              () =>
                  _profile.isLoading.value
                      ? SizedBox(
                        height: 100,
                        //width: ResponsiveSize.screenWidth,
                        child: ShimmerLoader(height: 80, width: 80),
                      )
                      : SizedBox(
                        height: ResponsiveSize.screenHeight * 0.11,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          //padding: EdgeInsets.only(left: 10),
                          itemBuilder: (ctx, index) {
                            return Card(
                              color: const Color.fromARGB(255, 190, 199, 246),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: CategoryItemforhomescreen(
                                  widthSize: getScreeWidth(100),
                                  item: categoryList[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            ),
            getVerticalSpace(10),
            Obx(
              () =>
                  _profile.isLoading.value
                      ? SizedBox(
                        height: 300,
                        width: ResponsiveSize.screenWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (ctx, index) {
                            return const ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: ShimmerLoader(height: 80, width: 80),
                              title: ShimmerLoader(height: 20),
                              subtitle: ShimmerLoader(height: 10, width: 50),
                            );
                          },
                        ),
                      )
                      : Container(
                        color: const Color.fromARGB(255, 230, 234, 183),
                        child: ExpansionTile(
                          leading: Icon(Icons.photo_album),
                          title: Text(
                            "वधु (Bride)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                "मांगलिक (Manglik)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () {
                                _profile.title.value =
                                    "मांगलिक वधु (Manglik Brides)";
                                _profile.showcat.value = true;
                                //_profile.selected.clear();
                                _profile.selected.value =
                                    _profile.manglikfemaleprofiles;
                                _profile.Nselected.value =
                                    _profile.manglikfemaleprofiles;
                                _profile.nameselected.value =
                                    _profile.manglikfemaleprofiles;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileList(),
                                  ),
                                );
                              },
                            ),
                            Divider(thickness: 1.5),
                            ListTile(
                              title: Text(
                                "नॉन मांगलिक (Non-Manglik)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () {
                                _profile.title.value =
                                    "नॉन मांगलिक वधु (Non Manglik Brides)";
                                _profile.showcat.value = true;
                                // _profile.selected.clear();
                                _profile.selected.value =
                                    _profile.femaleprofiles;
                                _profile.Nselected.value =
                                    _profile.femaleprofiles;
                                _profile.nameselected.value =
                                    _profile.femaleprofiles;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileList(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
            ),
            Obx(
              () =>
                  _profile.isLoading.value
                      ? SizedBox(
                        height: 300,
                        width: ResponsiveSize.screenWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (ctx, index) {
                            return const ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: ShimmerLoader(height: 80, width: 80),
                              title: ShimmerLoader(height: 20),
                              subtitle: ShimmerLoader(height: 10, width: 50),
                            );
                          },
                        ),
                      )
                      : Container(
                        color: const Color.fromARGB(255, 230, 234, 183),
                        child: ExpansionTile(
                          leading: Icon(Icons.photo_album),
                          title: Text(
                            "वर (Grooms)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                "मांगलिक (Manglik)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () {
                                _profile.title.value =
                                    "मांगलिक वर(Manglik Grooms)";
                                _profile.showcat.value = true;
                                //_profile.selected.clear();
                                _profile.selected.value =
                                    _profile.manglikmaleprofiles;
                                _profile.Nselected.value =
                                    _profile.manglikmaleprofiles;
                                _profile.nameselected.value =
                                    _profile.manglikmaleprofiles;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileList(),
                                  ),
                                );
                              },
                            ),
                            Divider(thickness: 1.5),
                            ListTile(
                              title: Text(
                                "नॉन मांगलिक (Non-Manglik)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () {
                                _profile.title.value =
                                    "नॉन मांगलिक वर (Non Manglik Grooms)";
                                _profile.showcat.value = true;
                                //_profile.selected.clear();
                                _profile.selected.value = _profile.maleprofiles;
                                _profile.Nselected.value =
                                    _profile.maleprofiles;
                                _profile.nameselected.value =
                                    _profile.maleprofiles;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileList(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
            ),
            /*  Obx(()=>_profile.isLoading.value?
            SizedBox(
              height: 300,
              width: ResponsiveSize.screenWidth,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (ctx, index) {
                  return Container(child:
                  ShimmerLoader(height: ResponsiveSize.screenHeight*0.2, width: 80),
                  );
                },
              ),
            ):

                Category()),*/
            /* Container(
              child: Card(
                child: Column(
                  children: [
                    BoldHeading(title:"सभी प्रोफाइल",size:20,bold:true,type: 'All',),
                    Divider(),
                    Obx(()=>
                    _profile.isLoading.value?
                    SizedBox(
                      height: 300,
                      width: ResponsiveSize.screenWidth,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return const ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: ShimmerLoader(height: 80, width: 80),
                            title: ShimmerLoader(height: 20),
                            subtitle: ShimmerLoader(height: 10, width: 50),
                          );
                        },
                      ),
                    ):
                    SizedBox(
                      height: 300,
                      width: ResponsiveSize.screenWidth,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return Container(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading:_profile.profiles[index].PhotoLink1!="NA"?Image(image: NetworkImage(_profile.profiles[index].PhotoLink1!)):
                                  Image(image: AssetImage("image/na.jpg")
                                ),
                              title: Text(_profile.profiles[index].Name!),
                              subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _profile.profiles[index].Gender=="M"?Text("(सुपुत्र "+_profile.profiles[index].Mother!+" एवं "+_profile.profiles[index].Father!+")")
                                  :Text("(सुपुत्री "+_profile.profiles[index].Mother!+" एवं "+_profile.profiles[index].Father!+")"),
                                  Text(_profile.profiles[index].BirthPlace!),
                                ],
                              ),
                              trailing: Icon(Icons.navigate_next),
                              onTap: ()async{
                                Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                                await _profile.getindividualprofiles(id:_profile.profiles[index].id);

                              },
                            ),
                          );
                        },
                      ),
                    ),

                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Column(
                children: [
                  BoldHeading(title:"वर चाहिए",size:20,bold:true,type: 'Male',),
                  Divider(),
                  Obx(()=>
                  _profile.isLoading.value?
                  SizedBox(
                    height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ShimmerLoader(height: 80, width: 80),
                          title: ShimmerLoader(height: 20),
                          subtitle: ShimmerLoader(height: 10, width: 50),
                        );
                      },
                    ),
                  ):
                  SizedBox(
                    height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading:_profile.maleprofiles[index].PhotoLink1!="NA"?Image(image: NetworkImage(_profile.maleprofiles[index].PhotoLink1!)):
                            Image(image: AssetImage("image/na.jpg")
                            ),
                            title: Text(_profile.maleprofiles[index].Name!),
                            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _profile.maleprofiles[index].Gender=="M"?Text("(सुपुत्र "+_profile.maleprofiles[index].Mother!+" एवं "+_profile.maleprofiles[index].Father!+")")
                                    :Text("(सुपुत्री "+_profile.maleprofiles[index].Mother!+" एवं "+_profile.maleprofiles[index].Father!+")"),
                                Text(_profile.maleprofiles[index].BirthPlace!),
                              ],
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: ()async{
                              Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                              await _profile.getindividualprofiles(id:_profile.maleprofiles[index].id);

                            },
                          ),
                        );
                      },
                    ),
                  ),

                  ),
                ],
              ),
            ),

            Card(
              child: Column(
                children: [
                  BoldHeading(title:"वधु चाहिए",size:20,bold:true,type: 'Female',),
                  Divider(),
                  Obx(()=>
                  _profile.isLoading.value?
                  SizedBox(
                    height:300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ShimmerLoader(height: 80, width: 80),
                          title: ShimmerLoader(height: 20),
                          subtitle: ShimmerLoader(height: 10, width: 50),
                        );
                      },
                    ),
                  ):
                  SizedBox(
                    height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading:_profile.femaleprofiles[index].PhotoLink1!="NA"?Image(image: NetworkImage(_profile.femaleprofiles[index].PhotoLink1!)):
                            Image(image: AssetImage("image/na.jpg")
                            ),
                            title: Text(_profile.femaleprofiles[index].Name!),
                            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _profile.femaleprofiles[index].Gender=="M"?Text("(सुपुत्र "+_profile.femaleprofiles[index].Mother!+" एवं "+_profile.femaleprofiles[index].Father!+")")
                                    :Text("(सुपुत्री "+_profile.femaleprofiles[index].Mother!+" एवं "+_profile.femaleprofiles[index].Father!+")"),
                                Text(_profile.femaleprofiles[index].BirthPlace!),
                              ],
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: ()async{
                              Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                              await _profile.getindividualprofiles(id:_profile.femaleprofiles[index].id);

                            },
                          ),
                        );
                      },
                    ),
                  ),

                  ),
                ],
              ),
            ),

            Card(
              child: Column(
                children: [
                  BoldHeading(title:"मांगलिक",size:20,bold:true,type: 'Manglik',),
                  Divider(),
                  Obx(()=>
                  _profile.isLoading.value?
                  SizedBox( height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ShimmerLoader(height: 80, width: 80),
                          title: ShimmerLoader(height: 20),
                          subtitle: ShimmerLoader(height: 10, width: 50),
                        );
                      },
                    ),
                  ):
                  SizedBox(
                    height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading:_profile.manglikprofiles[index].PhotoLink1!="NA"?Image(image: NetworkImage(_profile.manglikprofiles[index].PhotoLink1!)):
                            Image(image: AssetImage("image/na.jpg")
                            ),
                            title: Text(_profile.manglikprofiles[index].Name!),
                            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _profile.manglikprofiles[index].Gender=="M"?Text("(सुपुत्र "+_profile.manglikprofiles[index].Mother!+" एवं "+_profile.manglikprofiles[index].Father!+")")
                                    :Text("(सुपुत्री "+_profile.manglikprofiles[index].Mother!+" एवं "+_profile.manglikprofiles[index].Father!+")"),
                                Text(_profile.manglikprofiles[index].BirthPlace!),
                              ],
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: ()async{
                              Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                              await _profile.getindividualprofiles(id:_profile.manglikprofiles[index].id);

                            },
                          ),
                        );
                      },
                    ),
                  ),

                  ),
                ],
              ),
            ),

            Card(
              child: Column(
                children: [
                  BoldHeading(title:"नॉन मांगलिक",size:20,bold:true,type: 'nonManglik',),
                  Divider(),
                  Obx(()=>
                  _profile.isLoading.value?
                  SizedBox( height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ShimmerLoader(height: 80, width: 80),
                          title: ShimmerLoader(height: 20),
                          subtitle: ShimmerLoader(height: 10, width: 50),
                        );
                      },
                    ),
                  ):
                  SizedBox(
                    height: 300,
                    width: ResponsiveSize.screenWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading:_profile.nonmanglikprofiles[index].PhotoLink1!="NA"?Image(image: NetworkImage(_profile.nonmanglikprofiles[index].PhotoLink1!)):
                            Image(image: AssetImage("image/na.jpg")
                            ),
                            title: Text(_profile.nonmanglikprofiles[index].Name!),
                            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _profile.nonmanglikprofiles[index].Gender=="M"?Text("(सुपुत्र "+_profile.nonmanglikprofiles[index].Mother!+" एवं "+_profile.nonmanglikprofiles[index].Father!+")")
                                    :Text("(सुपुत्री "+_profile.nonmanglikprofiles[index].Mother!+" एवं "+_profile.nonmanglikprofiles[index].Father!+")"),
                                Text(_profile.nonmanglikprofiles[index].BirthPlace!),
                              ],
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: ()async{
                              Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                              await _profile.getindividualprofiles(id:_profile.nonmanglikprofiles[index].id);

                            },
                          ),
                        );
                      },
                    ),
                  ),

                  ),
                ],
              ),
            ),*/
            getVerticalSpace(10),
            Text(
              "चयनित प्रोफाइल (Selected Profiles)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Obx(
              () =>
                  _profile.isLoading.value
                      ? SizedBox(
                        height: 300,
                        width: ResponsiveSize.screenWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (ctx, index) {
                            return const ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: ShimmerLoader(height: 80, width: 80),
                              title: ShimmerLoader(height: 20),
                              subtitle: ShimmerLoader(height: 10, width: 50),
                            );
                          },
                        ),
                      )
                      : HotProducts(_profile.specialProfiles.length, "special"),
            ),
            Text(
              "नये प्रोफाइल - वर (Latest Profiles Groom)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Obx(
              () =>
                  _profile.isLoading.value
                      ? SizedBox(
                        height: 300,
                        width: ResponsiveSize.screenWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (ctx, index) {
                            return const ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: ShimmerLoader(height: 80, width: 80),
                              title: ShimmerLoader(height: 20),
                              subtitle: ShimmerLoader(height: 10, width: 50),
                            );
                          },
                        ),
                      )
                      : HotProducts(5, "male"),
            ),
            Text(
              "नये प्रोफाइल वधु (Latest Profile Bride)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Obx(
              () =>
                  _profile.isLoading.value
                      ? SizedBox(
                        height: 300,
                        width: ResponsiveSize.screenWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (ctx, index) {
                            return const ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: ShimmerLoader(height: 80, width: 80),
                              title: ShimmerLoader(height: 20),
                              subtitle: ShimmerLoader(height: 10, width: 50),
                            );
                          },
                        ),
                      )
                      : HotProducts(5, "female"),
            ),

            BannerPanel(),
            getVerticalSpace(20),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProfileUserScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 167, 100, 178),
                  ),
                ), // background
                child: Text(
                  "नई प्रोफाइल जोड़ने के लिए यहाँ क्लिक करे\n(Click here to Add New Profile)",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 165, 93, 93),
                  ),
                ), // background
                child: Text(
                  "फीडबैक,सुझाव या सराहना के लिए यहाँ क्लिक करे\n (Feedback,Suggestion or appraisals)",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 78, 109, 134),
                  ),
                ), // background
                child: Text(
                  "स्वयं की प्रोफाइल में परिवर्तन या अपडेट सूचित करे\n Request for change/updates in your profile ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchwithID()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 63, 105, 65),
                  ),
                ), // background
                child: Text(
                  "ID द्वारा प्रोफाइल सर्च करने के लिए यहाँ दबाएं \n(Search Profile using ID)",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            getVerticalSpace(20),

            AdBannerPanel(),
            getVerticalSpace(20),
          ],
        ),
      ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getHorizontalSpace(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "जैसवाल जैन परिणय",
                      style: GoogleFonts.dancingScript(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      "Jaiswal Jain Parinay",
                      style: GoogleFonts.dancingScript(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
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
