import 'package:aprjnew/GlobalUtilities/Controllers/basecontroller.dart';
import 'package:aprjnew/GlobalUtilities/services/profileservices.dart';
import 'package:get/get.dart';
import '../../classes/PersonalProfilewithcontact.dart';
import '../../utilities/Helpers/dialog_helper.dart';

class ProfileController extends GetxController with BaseController {
  var isLoading = false.obs;
  var errorMsg = "".obs;
  var title = "".obs;
  var showcat = true.obs;
  var city = "NA".obs;
  var qual = "NA".obs;
  var profes = "NA".obs;
  var expandedfiter = false.obs;
  var fage = "18".obs;
  var tage = "40".obs;
  RxList<PersonalProfilewithc> selected = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> profiles = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> maleprofiles = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> manglikmaleprofiles =
      <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> femaleprofiles = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> manglikfemaleprofiles =
      <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> manglikprofiles = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> nonmanglikprofiles =
      <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> specialProfiles = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> Nselected = <PersonalProfilewithc>[].obs;
  RxList<PersonalProfilewithc> nameselected = <PersonalProfilewithc>[].obs;
  var individual = PersonalProfilewithc().obs;
  var searchedprofile = PersonalProfilewithc().obs;

  @override
  void onInit() {
    getprofiles();
  }

  Future getprofiles() async {
    //print("getbannercalled");
    try {
      isLoading(true);
      final result = await ProfileServices.instance.getprofiles();
      if (result['code'] != 200) {
        errorMsg.value = result['data'];
      } else {
        addprofile(result['data']);
      }
      update();
    } catch (e) {
      print(e);
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

  void addprofile(result) {
    profiles.value = result;
    print(profiles.length);
    print("Hello");
    try {
      maleprofiles.value =
          profiles
              .where((profile) => profile.Gender!.toLowerCase().startsWith("m"))
              .toList();
      print("Hello1");
    } catch (e) {
      print(e);
    }

    manglikmaleprofiles.value =
        profiles
            .where(
              (profile) =>
                  profile.Gender!.toLowerCase().startsWith("m") &&
                  profile.Manglik!.toLowerCase().startsWith("1"),
            )
            .toList();
    print("Hello2");
    manglikfemaleprofiles.value =
        profiles
            .where(
              (profile) =>
                  profile.Gender!.toLowerCase().startsWith("f") &&
                  profile.Manglik!.toLowerCase().startsWith("1"),
            )
            .toList();
    print("Hello3");
    femaleprofiles.value =
        profiles
            .where((profile) => profile.Gender!.toLowerCase().startsWith("f"))
            .toList();
    print("Hello5");
    manglikprofiles.value =
        profiles
            .where((profile) => profile.Manglik!.toLowerCase().startsWith("0"))
            .toList();
    print("Hello6");
    nonmanglikprofiles.value =
        profiles
            .where((profile) => profile.Manglik!.toLowerCase().startsWith("1"))
            .toList();
    print("Hello7");
    specialProfiles.value =
        profiles
            .where((profile) => profile.Special!.toInt().isEqual(1))
            .toList();
  }

  Future getindividualprofiles({required id}) async {
    print("getindicalled");
    try {
      isLoading(true);
      final result = await ProfileServices.instance.getindividualprofiles(id);
      if (result['code'] != 200) {
        errorMsg.value = result['data'];
      } else {
        individual.value = result['data'];
      }
      update();
    } catch (e) {
      print(e);
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

  Future getprofileswithsnumber({required sno}) async {
    try {
      isLoading(true);
      final result = await ProfileServices.instance.getprofileswithsno(
        sno: sno,
      );
      if (result['code'] != 200) {
        errorMsg.value = result['data'];
      } else {
        print(result['data']);
        searchedprofile.value = result['data'];
        print(searchedprofile.value.PhotoLink1);
        Get.back();
      }
      update();
    } catch (e) {
      print(e);
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

  getfiltered(String s) {
    switch (s) {
      case 'Engineer':
        print("engineer");
        print(profiles.length);
        title.value = "Engineers";
        //showcat.value=false;
        //selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("engineer") ||
                      profile.Qualification!.toLowerCase().contains(
                        "engineer",
                      ) ||
                      profile.Qualification!.toLowerCase().endsWith("tech") ||
                      profile.Qualification!.toLowerCase().startsWith("b e") ||
                      profile.Qualification!.toLowerCase().startsWith(
                        "b tech",
                      ) ||
                      profile.Qualification!.toLowerCase().startsWith("m tech"),
                )
                .toList();
        print(selected.length);
        update();
        break;
      case 'Business':
        //selected.clear();
        print(profiles.length);
        title.value = "Business";
        showcat.value = false;
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().contains("business"),
                )
                .toList();
        print(selected.length);
        update();
        break;
      case 'Doctor':
        //selected.clear();
        title.value = "Doctor";
        //showcat.value=false;
        Nselected.value =
            profiles
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
        update();
        break;
      case 'CA':
        title.value = "CA";
        showcat.value = false;
        // selected.clear();
        Nselected.value =
            profiles
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
        update();
        break;
      case 'Teacher':
        title.value = "Teacher";
        showcat.value = false;
        //selected.clear();
        Nselected.value =
            profiles
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
        update();
        break;

      case 'Commerce':
        title.value = "Commerce";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("ca") ||
                      profile.Qualification!.toLowerCase().startsWith("cs") ||
                      profile.Qualification!.toLowerCase().startsWith(
                        "b.com",
                      ) ||
                      profile.Qualification!.toLowerCase().startsWith("m.com"),
                )
                .toList();
        update();
        break;
      case 'Graduate':
        title.value = "Graduate";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("b.a") ||
                      profile.Qualification!.toLowerCase().startsWith("b") ||
                      profile.Qualification!.toLowerCase().startsWith("b.com"),
                )
                .toList();
        update();
        break;
      case 'IT':
        title.value = "IT";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("bca") ||
                      profile.Qualification!.toLowerCase().startsWith("mca") ||
                      profile.Profession!.toLowerCase().startsWith(
                        "software",
                      ) ||
                      profile.Designation!.toLowerCase().startsWith("software"),
                )
                .toList();
        update();
        break;
      case 'MBA':
        title.value = "MBA";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("mba"),
                )
                .toList();
        update();
        break;
        break;
      case 'Legal':
        title.value = "B.E";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Qualification!.toLowerCase().startsWith("llb") ||
                      profile.Qualification!.toLowerCase().startsWith("llm") ||
                      profile.Profession!.toLowerCase().startsWith("legal") ||
                      profile.Profession!.toLowerCase().startsWith("advocate"),
                )
                .toList();
        update();
        break;
        break;
      case 'Startup':
        title.value = "Startup";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().startsWith("startup") ||
                      profile.Profession!.toLowerCase().startsWith(
                        "entrepreneur",
                      ),
                )
                .toList();
        update();
        break;
      case 'Govt. Job':
        title.value = "Govt. Job";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().startsWith("govt"),
                )
                .toList();
        update();
        break;
      case 'Pvt. Job':
        title.value = "Pvt. Job";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            profiles
                .where(
                  (profile) =>
                      profile.Profession!.toLowerCase().startsWith("pvt") ||
                      profile.Profession!.toLowerCase().startsWith("private"),
                )
                .toList();
        update();
        break;
    }
  }

  getfilteredforinside(String s) {
    switch (s) {
      case 'Engineer':
        print("engineer");
        print(profiles.length);
        title.value = "Engineers";
        //showcat.value=false;
        //selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Profession!.toLowerCase().contains("engineer") ||
                  profile.Qualification!.toLowerCase().contains("engineer") ||
                  profile.Qualification!.toLowerCase().endsWith("tech") ||
                  profile.Qualification!.toLowerCase().startsWith("b e") ||
                  profile.Qualification!.toLowerCase().startsWith("b tech") ||
                  profile.Qualification!.toLowerCase().startsWith("m tech"),
            ).toList();
        print(selected.length);
        update();
        break;
      case 'Business':
        //selected.clear();
        print(profiles.length);
        title.value = "Business";
        showcat.value = false;
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Profession!.toLowerCase().contains("business"),
            ).toList();
        print(selected.length);
        update();
        break;
      case 'Doctor':
        //selected.clear();
        title.value = "Doctor";
        //showcat.value=false;
        Nselected.value =
            Nselected.where(
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
            ).toList();
        update();
        break;
      case 'CA':
        title.value = "CA";
        showcat.value = false;
        // selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Qualification!.toLowerCase().startsWith("ca") ||
                  profile.Qualification!.toLowerCase().startsWith("cs") ||
                  profile.Designation!.toLowerCase().startsWith("ca") ||
                  profile.Designation!.toLowerCase().startsWith("cs") ||
                  profile.Profession!.toLowerCase().startsWith("ca") ||
                  profile.Profession!.toLowerCase().startsWith("cs"),
            ).toList();
        update();
        break;
      case 'Teacher':
        title.value = "Teacher";
        showcat.value = false;
        //selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Designation!.toLowerCase().contains("teacher") ||
                  profile.Designation!.toLowerCase().contains("lecturer") ||
                  profile.Designation!.toLowerCase().contains("professor") ||
                  profile.Designation!.toLowerCase().contains("tution") ||
                  profile.Designation!.toLowerCase().contains("coaching") ||
                  profile.Designation!.toLowerCase().contains("instructor") ||
                  profile.Qualification!.toLowerCase().endsWith("ed") ||
                  profile.Profession!.toLowerCase().contains("teacher") ||
                  profile.Profession!.toLowerCase().contains("lecturer") ||
                  profile.Profession!.toLowerCase().contains("tution") ||
                  profile.Profession!.toLowerCase().contains("coaching"),
            ).toList();
        update();
        break;

      case 'Commerce':
        title.value = "Commerce";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Qualification!.toLowerCase().startsWith("ca") ||
                  profile.Qualification!.toLowerCase().startsWith("cs") ||
                  profile.Qualification!.toLowerCase().startsWith("b.com") ||
                  profile.Qualification!.toLowerCase().startsWith("m.com"),
            ).toList();
        update();
        break;
      case 'Graduate':
        title.value = "Graduate";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Qualification!.toLowerCase().startsWith("b.a") ||
                  profile.Qualification!.toLowerCase().startsWith("b") ||
                  profile.Qualification!.toLowerCase().startsWith("b.com"),
            ).toList();
        update();
        break;
      case 'IT':
        title.value = "IT";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Qualification!.toLowerCase().startsWith("bca") ||
                  profile.Qualification!.toLowerCase().startsWith("mca") ||
                  profile.Profession!.toLowerCase().startsWith("software") ||
                  profile.Designation!.toLowerCase().startsWith("software"),
            ).toList();
        update();
        break;
      case 'MBA':
        title.value = "MBA";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Qualification!.toLowerCase().startsWith("mba"),
            ).toList();
        update();
        break;
        break;
      case 'Legal':
        title.value = "B.E";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Qualification!.toLowerCase().startsWith("llb") ||
                  profile.Qualification!.toLowerCase().startsWith("llm") ||
                  profile.Profession!.toLowerCase().startsWith("legal") ||
                  profile.Profession!.toLowerCase().startsWith("advocate"),
            ).toList();
        update();
        break;
        break;
      case 'Startup':
        title.value = "Startup";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Profession!.toLowerCase().startsWith("startup") ||
                  profile.Profession!.toLowerCase().startsWith("entrepreneur"),
            ).toList();
        update();
        break;
      case 'Govt. Job':
        title.value = "Govt. Job";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) => profile.Profession!.toLowerCase().startsWith("govt"),
            ).toList();
        update();
        break;
      case 'Pvt. Job':
        title.value = "Pvt. Job";
        showcat.value = false;
        // _profile.selected.clear();
        Nselected.value =
            Nselected.where(
              (profile) =>
                  profile.Profession!.toLowerCase().startsWith("pvt") ||
                  profile.Profession!.toLowerCase().startsWith("private"),
            ).toList();
        update();
        break;
    }
  }

  getfilterbyname(String s, List<PersonalProfilewithc> nameselecteds) {
    Nselected.value =
        nameselecteds
            .where(
              (profile) =>
                  profile.Name!.toLowerCase().startsWith(s.toLowerCase()) /*||
        profile.Father!.toLowerCase().contains(s)
*/,
            )
            .toList();
    print(Nselected.length);
    update();
  }

  Future newdeleterequest({required newreq}) async {
    try {
      isLoading(true);
      final result = await ProfileServices.instance.deleterequest(newreq);
      if (result['code'] != 200) {
        errorMsg.value = result['data'];
        Get.back();
        DialogHelper.instance.showErrorDialog(
          title: "Error Occurred",
          description: errorMsg.value,
        );
      } else {
        Get.back();
        DialogHelper.instance.showErrorDialog(
          title: "Request Saved",
          description: result["data"],
        );
      }
      update();
    } catch (e) {
      handleError(e);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future newreportflag({required newreq}) async {
    try {
      isLoading(true);
      final result = await ProfileServices.instance.deleterequest(newreq);
      if (result['code'] != 200) {
        errorMsg.value = result['data'];
        Get.back();
        DialogHelper.instance.showErrorDialog(
          title: "Error Occurred",
          description: errorMsg.value,
        );
      } else {
        Get.back();
        DialogHelper.instance.showErrorDialog(
          title: "Request Saved",
          description: result["data"],
        );
      }
      update();
    } catch (e) {
      handleError(e);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
