import 'package:aprjnew/Constants/app_color.dart';
import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/size.dart';
import '../classes/PersonalProfilewithcontact.dart';
import '../utilities/Helpers/dialog_helper.dart';
import '../utilities/Helpers/shimmer_effect_loader.dart';

class IndividualProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'HI');

    ProfileController _profile = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () =>
              _profile.isLoading.value
                  ? Text("loading")
                  : Text(_profile.individual.value.Name! + ' Profile'),
        ),
      ),
      body: Obx(
        () =>
            _profile.isLoading.value
                ? SizedBox(
                  height: 300,
                  width: ResponsiveSize.screenWidth,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: ShimmerLoader(height: 64, width: 64),
                            title: ShimmerLoader(height: 18),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: ShimmerLoader(height: 12, width: 80),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  children: [
                    Row(
                      children: [
                        _Pill(
                          label: _profile.individual.value.Sno ?? '',
                          icon: Icons.tag_rounded,
                        ),
                        const SizedBox(width: 8),
                        _Pill(
                          label: getmanglikstatus(
                            _profile.individual.value.Manglik,
                          ),
                          icon: Icons.auto_awesome_rounded,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Card(
                      elevation: 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Ink.image(
                          image: NetworkImage(
                            fetchImage(_profile.individual.value.PhotoLink1)!,
                          ),
                          fit: BoxFit.cover,
                          child: InkWell(onTap: () {}),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Card(
                      elevation: 0.6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _SectionTitle('व्यक्तिगत जानकारी'),
                            const SizedBox(height: 8),
                            _InfoRow(
                              label: 'नाम',
                              value: _profile.individual.value.Name ?? '',
                            ),
                            _InfoRow(
                              label: 'पिताजी',
                              value: _profile.individual.value.Father ?? '',
                            ),
                            _InfoRow(
                              label: 'माताजी',
                              value: _profile.individual.value.Mother ?? '',
                            ),
                            _InfoRow(
                              label: 'आयु',
                              value: getageondate(_profile.individual.value),
                            ),
                            _InfoRow(
                              label: 'ऊँचाई',
                              value: _profile.individual.value.Height ?? '',
                            ),
                            _InfoRow(
                              label: 'जन्म तिथि',
                              value:
                                  _profile.individual.value.DateOfBirth ?? '',
                            ),
                            _InfoRow(
                              label: 'जन्म समय',
                              value: _profile.individual.value.BirthTime ?? '',
                            ),
                            _InfoRow(
                              label: 'जन्म स्थान',
                              value: _profile.individual.value.BirthPlace ?? '',
                            ),
                            _InfoRow(
                              label: 'स्वयं का गोत्र',
                              value:
                                  getgotrainhindi(
                                    _profile.individual.value.GotraFather!,
                                  ) ??
                                  '',
                            ),
                            _InfoRow(
                              label: 'मामा का गोत्र',
                              value:
                                  getgotrainhindi(
                                    _profile.individual.value.GotraMother,
                                  ) ??
                                  '',
                            ),
                            _InfoRow(
                              label: 'विशेष',
                              value: _profile.individual.value.Quality ?? '',
                            ),
                            _InfoRow(
                              label: 'आय',
                              value:
                                  '₹ ${format.format(_profile.individual.value.Income!)}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Card(
                      elevation: 0.6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _SectionTitle('व्यावसायिक जानकारी'),
                            const SizedBox(height: 8),
                            _KeyValue(
                              k: 'Qualification/शिक्षा',
                              v: _profile.individual.value.Qualification ?? '',
                            ),
                            const Divider(height: 16),
                            _KeyValue(
                              k: 'Profession/व्यवसाय',
                              v: _profile.individual.value.Profession ?? '',
                            ),
                            const Divider(height: 16),
                            _KeyValue(
                              k: 'Organisation/संस्था',
                              v:
                                  getmultitext(
                                    _profile
                                        .individual
                                        .value
                                        .NameOfOrganisation,
                                  ) ??
                                  '',
                            ),
                            const Divider(height: 16),
                            _KeyValue(
                              k: 'Designation/पद',
                              v: _profile.individual.value.Designation ?? '',
                            ),
                            const Divider(height: 16),
                            _KeyValue(
                              k: 'City/शहर',
                              v: _profile.individual.value.WorkCity ?? '',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Card(
                      elevation: 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: kPrimaryColor,
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: SizedBox(
                                    height: 320,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            16,
                                            14,
                                            8,
                                            0,
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.support_agent_rounded,
                                              ),
                                              const SizedBox(width: 8),
                                              const Expanded(
                                                child: Text(
                                                  'जानकारी प्राप्त करने के लिए',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.close_rounded,
                                                ),
                                                onPressed:
                                                    () =>
                                                        Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        const Divider(height: 1),
                                        Expanded(
                                          child: ListView(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 6,
                                            ),
                                            children: [
                                              _ContactRow(
                                                title: '1. श्री रूपेश जैन',
                                                whatsappUrl:
                                                    "whatsapp://send?phone=+919999977294&text=कृपया मुझे प्रोफाइल ID: ${_profile.individual.value.Sno} नाम: ${_profile.individual.value.Name} पिताजी का नाम: ${_profile.individual.value.Father} D O B :${_profile.individual.value.DateOfBirth} के संपर्क सूत्र की जानकारी दीजिये ! ",
                                                callUrl: "tel://+919999977294",
                                              ),
                                              _ContactRow(
                                                title: '2. श्री अजय जैन',
                                                whatsappUrl:
                                                    "whatsapp://send?phone=+919826365877&text=कृपया मुझे प्रोफाइल ID: ${_profile.individual.value.Sno} नाम: ${_profile.individual.value.Name} पिताजी का नाम: ${_profile.individual.value.Father} D O B :${_profile.individual.value.DateOfBirth} के संपर्क सूत्र की जानकारी दीजिये ! ",
                                                callUrl: "tel://+919826365877",
                                              ),
                                              _ContactRow(
                                                title: '3. श्री रविन्द्र जैन',
                                                whatsappUrl:
                                                    "whatsapp://send?phone=+919826365877&text=कृपया मुझे प्रोफाइल ID: ${_profile.individual.value.Sno} नाम: ${_profile.individual.value.Name} पिताजी का नाम: ${_profile.individual.value.Father} D O B :${_profile.individual.value.DateOfBirth} के संपर्क सूत्र की जानकारी दीजिये ! ",
                                                callUrl: "tel://+919826365877",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          label: Text(
                            "इस प्रोफाइल के संपर्क सूत्र की जानकारी प्राप्त करने के लिए यहाँ दबाएं",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Column(
                      children: [
                        TextButton.icon(
                          icon: Icon(Icons.flag_outlined, color: kPrimaryColor),
                          onPressed: () {
                            DialogHelper.instance.reportflagconfirm(
                              context,
                              _profile.individual.value.Sno!,
                            );
                          },
                          label: Text(
                            "Report this profile/user",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          icon: Icon(Icons.block, color: kPrimaryColor),
                          onPressed: () {
                            DialogHelper.instance.blockconfirm(
                              context,
                              _profile.individual.value.Sno!,
                            );
                          },

                          label: Text(
                            "Block this profile/user",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),

                    // Ad box placeholder
                    const SizedBox(height: 12),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text('Advertisement'),
                    ),
                  ],
                ),
      ),
    );
  }

  String? fetchImage(photoLink1) {
    if (photoLink1 == "NA") {
      return "https://nprservices.in/catalogue/APRJ/notavail.png";
    } else
      return photoLink1;
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final IconData icon;
  const _Pill({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: kshade2,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: kPrimaryColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$label :',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}

class _KeyValue extends StatelessWidget {
  final String k;
  final String v;
  const _KeyValue({required this.k, required this.v});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            k,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(v, style: const TextStyle(fontSize: 12))),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String title;
  final String whatsappUrl;
  final String callUrl;
  const _ContactRow({
    required this.title,
    required this.whatsappUrl,
    required this.callUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => launchUrl(Uri.parse(whatsappUrl)),
            child: Image.asset('image/icons/whatsapp.png', height: 28),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => launchUrl(Uri.parse(callUrl)),
            icon: const Icon(Icons.call),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

void sendMessage(String text) {
  var txt = text;
  _launchURL(txt);
}

var _url = "https://api.whatsapp.com/send?phone=919999977294";
void _launchURL(txt) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

String? getmultitext(text) {
  int length = text.length;
  if (length > 18) {
    return text.substring(0, 18) + "\n-" + text.substring(18, length);
  } else
    return text;
}

getfontsize(String father) {
  if (father.length >= 14) {
    return 12.0;
  } else
    return 12.0;
}

String? getstatename(country) {
  switch (country) {
    case 'GJ':
      return "Gujrat";

    case 'MP':
      return "Madhya Pradesh";

    case 'UP':
      return "Uttar Pradesh";

    case 'RJ':
      return "Rajasthan";

    case 'MH':
      return "Maharashtra";

    case 'WB':
      return "West Bengal";

    case 'DL':
      return "Delhi NCR";

    default:
      return country;
  }
}

String? getgotrainhindi(String? gotraFather) {
  switch (gotraFather) {
    case 'NA':
      return "उपलब्ध नहीं ";

    case "AGRAIYA":
      return "अगरैया";

    case "UCHARIYA":
      return "उचाड़िया";

    case "UNNERIYA":
      return "उन्नेरिया";

    case "KATHERIYA":
      return "कठेरिया";

    case "KOTIYA":
      return "कोटिया";

    case "KAPRIYA":
      return "कपरिया";

    case "KOLANAYAK":
      return "कोलानायक";

    case "KUHELE":
      return "कुहेले";

    case "GADA KE SHAH":
      return "गढ़ा के शाह";

    case "GANDHI":
      return "गन्धी";

    case "GHIYA":
      return "घीया";

    case "CHADOSIYA":
      return "चड़ोसिया";

    case "CHADOSIA":
      return "चड़ोसिया";

    case "CHIKANIYA":
      return "चिकनिया";

    case "CHORIYA":
      return "चौरिया";

    case "JANGDA":
      return "जागड़ा";

    case "JHARE KE PANDYA":
      return "झारी के पाण्डिया";

    case "THAKURIA":
      return "ठकुरिया";

    case "THAKURIYA":
      return "ठकुरिया";

    case "DHILWARI":
      return "ढिलवारी";

    case "DANGASIYA":
      return "दनगसिया";

    case "DHANGA":
      return "धांगा";

    case "NAYAK":
      return "नायक";

    case "NAHARMOODHA":
      return "नाहरमूढा";

    case "PACHGAIYA":
      return "पचगइयां";

    case "PACHMEHARIYA":
      return "पचमेहरिया";

    case "PANDIYA":
      return "पाण्डिया";

    case "PUNVIYA":
      return "पुनविया";

    case "PURIYA":
      return "पुरिया";

    case "PUNARAWAT":
      return "पूणारावत";

    case "BAGHORIYA":
      return "बघोरिया";

    case "BAJAJ":
      return "बजाज";

    case "BARETHA":
      return "बरैठा";

    case "BHANDARI":
      return "भण्डारी";

    case "MIDAKHURIYA":
      return "मिड़ाखुरिया";

    case "MOONJI":
      return "मूंजी";

    case "MAHTIYA":
      return "मेंहतिया";

    case "MOHARIYA":
      return "महोरिया";

    case "RANPURIYA":
      return "रनपुरिया";

    case "RAWAT":
      return "रावत";

    case "LAKHESURI":
      return "लखेश्वरी";

    case "LAKHESHWARI":
      return "लखेश्वरी";

    case "LOHARIYA":
      return "लोहरिया";

    case "SHAHBAJAJ":
      return "साहबजाज";

    case "SUTHANIYA":
      return "सुथनिया";

    case "SANDA":
      return "संडा";

    case "SAHULA":
      return "साहुला";

    default:
      return gotraFather.toString();
  }
}

getmanglikstatus(String? manglikstatus) {
  if (manglikstatus == "0") {
    return "नॉन मांगलिक";
  } else if (manglikstatus == "1") {
    return "मांगलिक";
  } else {
    return "आंशिक मांगलिक";
  }
}

getageondate(PersonalProfilewithc personalProfilewithc) {
  final df = new DateFormat('dd/MMM/yyyy');
  var outputFormat = DateFormat('dd/MM/yyyy');
  var outputDate = outputFormat.parse(personalProfilewithc.DateOfBirth!);
  print(personalProfilewithc.Name!);
  print(personalProfilewithc.DateOfBirth);
  print(outputDate);
  //print(DateTime.parse(personalProfilewithc.DateOfBirth!));
  return calculateAge(outputDate) + " वर्ष";
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



/*
class Individualwidget extends StatelessWidget {
  final PersonalProfilewithc? personalProfilewithc;

  Individualwidget(this.personalProfilewithc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(padding: EdgeInsets.only(top:10),),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left:30),),
              Text(personalProfile!.Sno!,style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12) ,),
              Padding(padding: EdgeInsets.only(left:30),),
              Text(getmanglikstatus(personalProfile.Manglik),style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12) ,),

            ],
          ),
          Padding(padding: EdgeInsets.only(top:20),),

          Container(
            child: SizedBox(height:300,
              child: Image(image:NetworkImage(fetchImage(personalProfile.PhotoLink1)!),height: 200,),),
          ),
          Padding(padding: EdgeInsets.only(top:20),),

          ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              "निजी/ Personal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            children: [
              Card(
                  child:Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                          Text("नाम",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("पिताजी",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("माताजी",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("आयु ",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("जन्म तिथि ",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("जन्म समय",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("जन्म स्थान",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("स्वयं का गोत्र",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("मामा का गोत्र",style:TextStyle(fontSize: 12)),
                          SizedBox(height: 5,)



                        ],
                      ),
                      SizedBox(width: 30,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(personalProfile.Name!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12),),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.Father!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.Father!))),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.Mother!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.Mother!))),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.Age!+" वर्ष",textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.DateOfBirth!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.BirthTime!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.BirthPlace!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text(getgotrainhindi(_profile.individual.value!.GotraFather)!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text(getgotrainhindi(_profile.individual.value!.GotraMother)!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                        ],
                      )


                    ],
                  )
              ),

            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              "व्यवसायिक/Professional",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            children: [
              Card(
                  child:Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Qualification/शिक्षा",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("Profession/व्यवसाय",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("Organisation/संस्था",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("Designation/पद",style:TextStyle(fontSize: 12)),
                          Divider(thickness: 0.5,),
                          Text("City/शहर",style:TextStyle(fontSize: 12)),

                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_profile.individual.value!.Qualification!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.Qualification!))),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.Profession!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.Profession!))),
                          Divider(thickness: 0.5,),
                          Text(getmultitext(_profile.individual.value!.NameOfOrganisation)!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.NameOfOrganisation!))),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.Designation!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.Designation!))),
                          Divider(thickness: 0.5,),
                          Text(_profile.individual.value!.WorkCity!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value!.WorkCity!)))
                        ],
                      )


                    ],
                  )
              ),

            ],
          ),
          Container(child: ElevatedButton(onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                        height: 300,

                        child:Column(
                            children:[
                              Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10)),
                              Center(child:Container(padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  child:Text("जानकारी प्राप्त करने के लिए \n1. श्री रूपेश जैन 99999-77-294\n2. श्री अजय जैन 94257-64033\n3. श्री रविन्द्र जैन, 98263-65877\n4. श्री अनिल जैन 94130-37563 \nको व्हाट्सप्प पर सूचित करे!",style: TextStyle(fontSize:15),)),),
                              ElevatedButton(onPressed: (){
                                String url= "whatsapp://send?text=कृपया मुझे प्रोफाइल ID: "+_profile.individual.value!.Sno.toString()+" नाम: "+_profile.individual.value!.Name.toString()+" पिताजी का नाम: "+
                                    _profile.individual.value!.Father.toString()+" D O B :"+_profile.individual.value!.DateOfBirth.toString() +" के संपर्क सूत्र की जानकारी दीजिये ! ";
                                launch(url);
                              }, child: Text("व्हाट्सप्प पर सूचित करने के लिए यहाँ दबाएं",textAlign: TextAlign.center,))
                            ])
                    ),


                  );

                });


          }, child:Align(alignment: Alignment.center,
              child:Text("इस प्रोफाइल के संपर्क सूत्र की जानकारी प्राप्त करने के लिए यहाँ दबाएं ",textAlign: TextAlign.center,)         ))),

          */
/*ExpansionTile(
           title: Text(
             "संपर्क सूत्र/Contact",
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
           ),
           children: [
             FutureBuilder(
                 future: getcontactinfo(http.Client(),_profile.individual.value!.Sno!,_profile.individual.value!.id!),
                 builder: (context, snapshot) {
                   if (snapshot.hasError)
                     print(snapshot.error);
                   return snapshot.hasData
                       ? Card(
                       child:Row(
                         children: [
                           Padding(padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                           Column(crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("नाम(Name)",style:TextStyle(fontSize: 18)),
                               Divider(thickness: 0.5,),
                               Text("मकान नंबर(House)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("गली/मोहल्ला(Street)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("गांव(Village)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("नगर/जिला(City)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("राज्य (State)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("देश(Country)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("पिनकोड(Pin)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("मोबाईल 1(Phone No)",style:TextStyle(fontSize: 12)),
                               Divider(thickness: 0.5,),
                               Text("मोबाईल 2(Phone No)",style:TextStyle(fontSize: 12)),
                               SizedBox(height: 10,)


                             ],
                           ),
                           SizedBox(width: 10,),
                           Column(crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(getmultitext(snapshot.data![0].NameOfCP.toString())!,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data![0].NameOfCP))),
                               Divider(thickness: 0.5,),
                               Text(snapshot.data[0].HouseNumber,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data![0].HouseNumber))),
                               Divider(thickness: 0.5,),
                               Text(getmultitext(snapshot.data![0].Street.toString())!,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data![0].Street))),
                               Divider(thickness: 0.5,),
                               Text(getmultitext(snapshot.data![0].VillageLocality)!,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data![0].VillageLocality))),
                               Divider(thickness: 0.5,),
                               Text(snapshot.data![0].City,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data[0].City))),
                               Divider(thickness: 0.5,),
                               Text(getstatename(snapshot.data[0].State)!,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data[0].State))),
                               Divider(thickness: 0.5,),
                               Text(snapshot.data[0].Country,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data[0].Country))),
                               Divider(thickness: 0.5,),
                               Text(snapshot.data[0].Pincode,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data[0].Pincode))),
                               Divider(thickness: 0.5,),
                               Text(snapshot.data[0].MobileNumber1,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data[0].MobileNumber1))),
                               Divider(thickness: 0.5,),
                               Text(snapshot.data[0].MobileNumber2,textAlign: TextAlign.left,
                                   style:TextStyle(fontSize: getfontsize(snapshot.data[0].MobileNumber1))),
                               SizedBox(height: 10,)

                             ],
                           )


                         ],
                       )
                   )
                       : Center(child: CircularProgressIndicator(),);
                 }
             ),

           ],
         ),*//*

          SizedBox(height: 100,width: 300,),//Advertisement Box

        ],

      ) ,

    );
  }

  String? fetchImage(photoLink1) {
    if(photoLink1=="NA"){
      return "https://nprservices.in/catalogue/APRJ/notavail.png";
    }
    else
      return photoLink1;
  }
  }
*/



