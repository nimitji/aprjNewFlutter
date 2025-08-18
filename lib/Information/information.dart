import 'package:aprjnew/classes/APPS.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utilities/Helpers/dialog_helper.dart';

class AppsList extends StatelessWidget {
  final List<Apps> appsprofiles;
  AppsList(this.appsprofiles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            child: Center(
              child: Text(
                "अविवाहित प्रतिभाएँ प्रस्तुति समूह",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              """
एक संक्षिप्त परिचय

अ० भा० उपरोंचिया जैसवाल जैन समाज में जब  अविवाहित बच्चों की जानकारी का अभाव समाज को महसूस हो रहा था , तब वर्ष 2016 में अविवाहित प्रतिभाएँ प्रस्तुति ग्रुप बनाकर देश की समस्त शैलियों के उन बच्चों के परिचय वाट्सएप के माध्यम से प्रस्तुत किये जो देश के दूर दराज महानगरों में अपनी सेवायें दे रहे, तथा व्यापार जगत में भी ऊचाईयाँ छू रहे  अविवाहित  बच्चों के परिचय प्रस्तुत किये ।

परिचय प्रस्तुति में देश भर की शेंलियों को एकत्रित कर ग्रुपों में जोड़ना एंव प्रस्तुति के लिए मार्गदर्शन श्री मर्हेन्द्रकुमार जी जैन मधुवन दिल्ली एंव श्नी रविन्द्र जी जैन जमूसर वालें  भोपाल का महत्व पूर्ण सहयोग रहा इनके सहयोग एंव समाज सेवा के अनेक महानूभावों के सहयोग से आज दस ग्रुपो के माध्यम से समाज के 2500 बन्धु इस प्रस्तुति को घर बैठे देख रहे है ।

यह प्रस्तृति 6-9-2016 को सर्वप्रथम  प्रांरभ की तव  भारतवर्षीय समाज ने इस प्रस्तुति को बहुत प्रोत्साहन दिया, कुछ समय पश्चात अनिल जी जैन मकराना वालों ने य़ह प्रस्तुति देखकर मुझसे परिचय का सेंटिंग एंव डिजायन करने का अपना मत प्रस्तुत किया ,बहुत ही अच्छा डिजायन एंव सेटिंग मुझे भेजा तब से आज तक उनके द्वारा लगभग 1700 परिचयों का डिजायन कर समाज के बीच प्रस्तुत कर चुके है जिसमें से 1300-1400 बच्चो के रिस्ते आप सभी के सहयोग से इस प्रस्तुति के माध्यम से हुए .,यह समाज के निरन्तर विकास के लिए बहुत बड़ी उपलब्धि है ।

अविवाहित प्रतिभाएँ पत्रिका का प्रकाशन भी 2018 एंव 2021 में दो बार हमारे ग्रुप द्रारा किया जिससे वाट्सएव न चलाने वाले समाज बन्धु पूरी तरह से लाभ ले रहे है प्रथम बार पत्रिका का विमोचन श्नी अतिश्य क्षेत्र बड़ागाँव त्रिलोक तीर्थ धाम में समाज के प्रमुख श्रेष्टियों  द्वारा किया गया ।

 द्धितीय पत्रिका का विमोचन फरवरी 2021 में सिद्धक्षेत्र सोनागिर जी पर देश भर के हजारो समाज बंधुओं की उपस्थिति में किया गया ।

अविवाहित प्रतिभाएँ प्रस्तुति समूह निरन्तर समाज के ह्रास रोकने एंव ज्यादा से ज्यादा सम्बंध समाज में होने के लिए अथक प्रयासरत है ,इस दिशा में  नये-नये प्रयास किये जा रहे है अविवाहित बच्चों की कार्य शाला जिसमें बच्चो एंव आविभावकों के मन मानस में यह भावना प्रेरित की जाती है कि समाज का रिस्ता समाज में ही होवे ,सिद्धक्षेत्र सोनागिर पर आयोजित कार्यशाला से समाज के बीच सार्थक परिणाम सुनने को मिले ।

आधुनिक प्रयास "जैसवाल जैन परिणय" एप के द्वारा देश भर के अविवाहित प्रतिभाओं की प्रस्तुति के  सफल प्रयास  समाज के ऊर्जावान हमारे साथी श्री रुपेश जी जैन, उत्तमनगर दिल्ली, द्वारा आधुनिकता की  नई तकनीक का प्रयोग करते हुए हजारों परिचय के साथ जैसवाल जैन परिणय एप का शुभारंभ किया है, जिसमें आप सभी को अपना परिचय एड करने एंव हटाने का पूर्ण अधिकार रहेगा एप के माध्यम से अपनी पसंद के मॉगलिक, नॉन मॉगलिक, इंजीनियर, डॉक्टर, एडव्होकेट, व्यापार जगत एवं सभी फील्ड से जुड़े हुए बच्चों की जानकारी मिनिट में घर बैठे प्राप्त कर सकते हैं  । 

समाज में आप सभी के सहयोग से वदलाव की लहर आई है ज्यादा से ज्यादा रिस्ते समाज में हो रहे है आप सभी का प्रयास रहेगा तो यह जैसवाल समाज हमेशा चलता रहेगा अब हम सभी को समाज वचाने में पूर्ण सहयोग देना है  जो समाज में रिस्तो की आशा बनाये बैठे है जो व्यात्ति समाज से बहार जा रहा है उनको जाने दें । बचे हुए समाज को बचाने में अपनी पूर्ण ऊर्जा का उपयोग करें ।

अविवाहितं प्रतिभाएँ प्रस्तुति कार्यकम को सफलता की ओर ले जाने में देश भर की समाज के सभी महानुभावों का सहयोग हैं साथ में सभी शेंलियों से एक सो से अधिक महानुभावों का समाज सेवा में संहयोग प्रदान कर इस समूह को ऊचाईयों पर पुहचायॉं है सभी के नाम लिखने में असमर्थ हूँ किन्तु आपका सहयोग संमाज को हमेशा स्मरणीय रहेगा ।

इस ओर एक कदम

अजय कुमार जैन
संयोजक
अविवाहित प्रतिभाएँ प्रस्तुति समूह
    
    
    """,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.justify,
            ),
          ),
          /*Container(padding:EdgeInsets.all(5),child:
          Text("""
उपरोंचिया दिगम्बर जैसवाल जैन समाज के 44 गोत्र

1. अगरैया
2.उचाड़िया
3. उन्नेरिया   
4. कठेरिया
5. कोटिया
6. कपरिया
7. कोलानायक
8. कुहेले
9. गढ़ा के शाह
10. गन्धी
11. घीया
12. चड़ोसिया
13. चिकनिया
14. चौरिया
15. जागड़ा
16. झारी के पाण्डिया
17. ठकुरिया
18. ढिलवारी
19. दनगसिया
20. धांगा
21. नायक
22. नाहरमूढा
23. पचगइयां
24. पचमेहरिया
25. पाण्डिया
26. पुनविया
27. पुरिया
28. पूणारावत
29. बघोरिया
30. बजाज
31. बरैठा
32. भण्डारी
33. मिड़ाखुरिया
34. मूंजी
35. मेंहतिया
36. महोरिया
37. रनपुरिया
38. रावत
39. लखेश्वरी
40. लोहरिया
41. साहबजाज
42. सुथनिया
43. संडा
44. साहुला
    
    """,style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,)),*/
          Container(
            child: Center(
              child: Text(
                "अविवाहित प्रतिभाएँ प्रस्तुति समूह",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          getlist(),
        ],
      ),
    );
  }

  getlist() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: appsprofiles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              child: InkWell(
                child: Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 5.0,
                              ),
                              height: 70,
                              width: 70,
                              child: Image(
                                image: NetworkImage(
                                  fetchImage(appsprofiles[index].Photolink),
                                ),
                                //height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 18),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      formatname(appsprofiles[index].Name!),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    appsprofiles[index].City!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  fetchImage(String? photoLink1) {
    if (photoLink1 == "NA") {
      return "https://nprservices.in/catalogue/APRJ/notavail.png";
    } else
      return photoLink1;
  }

  String? formatString(String? designation) {
    if (designation != "NA") {
      if (designation!.length < 17) {
        return designation;
      } else {
        return designation.substring(0, 17);
      }
    } else {
      return "Not Available";
    }
  }

  String formatname(String name) {
    if (name.length < 17) {
      return name;
    } else {
      return name.substring(0, 17) + '\n' + name.substring(17, name.length);
    }
  }
}

class Appslist extends StatefulWidget {
  @override
  _AppslisrState createState() => _AppslisrState();
}

class _AppslisrState extends State<Appslist> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "अविवाहित प्रतिभाएं प्रस्तुति समूह ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: fetchapps(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? _setpstate(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _setpstate(data) {
    return AppsList(data);
  }
}

class AdminList extends StatefulWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  _AdminListState createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  getlist() {
    return Column(
      children: [
        Container(
          child: InkWell(
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              "1. रूपेश जैन",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "उत्तम नगर, दिल्ली",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "99999-77-294",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          child: InkWell(
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              "2. श्री अजय जैन",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "शिवपुरी",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "94257-64033",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          child: InkWell(
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              "3. श्री रविन्द्र जी जैन 'जमूसर वाले'",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "भोपाल",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "98263-65877",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          child: InkWell(
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "मकराना",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "94130-37563",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Text('Delete My Account'),
            onPressed: () async {
              DialogHelper.instance.accountdeleteconfirm(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "एडमिन्स की जानकारियाँ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: getlist(),
    );
  }
}

class MarriageInfo extends StatefulWidget {
  const MarriageInfo({Key? key}) : super(key: key);

  @override
  _MarriageInfoState createState() => _MarriageInfoState();
}

class _MarriageInfoState extends State<MarriageInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("वैवाहिक कार्यक्रम-आवश्यकताएं")),
      body: ListView(
        children: [
          Container(
            child: Text(
              """
श्री दिगम्बर जैसवाल जैन "उपरोंचिया" समाज की परम्परा के अनुसार

मांगलिक वैवाहिक कार्यक्रम-आवश्यकताएं
--------------------------------------------
कन्या पक्ष के विवाह के मांगलिक कार्यक्रम हेतु सामग्री इत्यादि की व्यवस्था

"लगुन"
1.हल्दी साबुत                   21नग
2.हल्दी पिसी सकोरे में          1नग
3.छोटी सुपारी                    51नग
4.इलायची                         10ग्राम
5.नारियल                            4नग
6.सिक्के                             29नग
7.निमंत्रण पत्र(शादी के कार्ड)  5नग
8.लगुन के सिक्के
9.सादा कागज दस्ते का          1नग
10.लगन पत्रिका छपी             2नग
11.मलमल का कपडा (1मीटर) 2नग
12.चावल 50 ग्राम
13.दूब (घास)
14.कलावा-दो पिण्डी
15.थाली                               1नग
16.लोटा पानी का                   1नग
17.पीली चिट्ठी में वर पक्ष के
         पंचों के नाम
18.वर पक्ष के परिजनों के नाम
19.कन्या पक्ष के परिजनों के नाम
20.कन्या पक्ष के परिजनों के नाम
21.ग्रहस्थाचार्य (पंडित जी)
22.ढरा

भातई मिलाप
1.ढरा
2.कॉपी
3.पैन
4.थाली
5.रेजगारी
6.निहाली का बर्तन मिठाई सहित
7.पामड़े की धोती
8.परिवार की लिस्ट नाम
9.दूध (शरबत) या समयानुकूल
10.परिवार लिस्ट नाम (पुरुष)
11.परिवार लिस्ट नाम (महिला)

"मण्डप"
1.हल्दी गांठ                         1नग
2.छोटी सुपारी                      1नग
3.सिक्का                             1नग
4.चावल                             20ग्राम
5.लाल टूल कपडा
6.अशोक पत्ता
7.लोटा
8.लठिया (बांस)
9.लिफाफे
10.मिट्टी का डिब्बा कनस्तर
11.सिल-लुढिया
12.पटली सेट

"दरवाजे के लिए"
1.टंकी 4 सेट एवं छन्ने सहित
2.गोटादार पट्टी
3.जंजीर एक सोने की
4.₹151और 1सिक्का
5.सूट शर्ट सेट
6.नारियल
7.ढरा
8.पट्टा
9.मंगल कलश (मथानिया वाली द्वारा)
10.सास बारौठी की अंगूठी
11.मामा की मिलनी ₹10 से
12.चाचा की थाली
13.मामा का लोटा
14.मिलनी बारात के लिफ़ाफ़े

"भांवर/पाणिग्रहण संस्कार"

1.पटली
2.कढ़ाई (स्टील की)
3.पलंग बिस्तर सहित

"विदा"
मिलनी के लिफाफे वर पक्ष के परिवार जनों से पैर धुलाई
शरबत पिलाई
गूथ छुड़ाई
बागे 2 (मामा व थरीबंद का)

नोट:-
1.सास बारौठी के टीके के रूपये पंचों के पास पहुचाएं।
2.पलंग पर पीले हाथ के रुपये पंचों के पास पहुचाएं।
3.लिवऊओं के बागे एवं विदा वर पक्ष सुविधानुसार तय कर लें।
4.सभी कार्यक्रम मर्यादा एवं संस्कृति की प्रतिष्ठा के अनुसार कर, धर्म व समाज की परम्परा का निर्वाहन कर विवाह (पवित्र बन्धन) मांगलिक कार्यक्रम करके उत्कृष्ठ प्रस्तुत करें।
5.समय का विशेष ध्यान रखें।
__________

 वर पक्ष के विवाह के मांगलिक कार्यक्रम हेतु सामग्री इत्यादि की व्यवस्था

"लगुन"
1.शहनाई वादक
2.सौंफ इलायची की थाली
3.दूध या समयानुसार
4.बतासे/नारियल/अन्य (स्वेच्छानुसार)
5.ग्रहस्थाचार्य के पंच
6.वर पक्ष के पंच
7.ढरा
8.सिक्के-15

"निकासी"
1.ढोल-तासे
2.बैण्ड-बाजे
3.घोड़ी
4.छाता
5.साफा
6.कलंगी
7.कण्ठी माला
8.अण्डरवियर
9.बनियान
10.शर्ट-सूट
11.रुमाल
12.जूते
13.मोजे
14.खीकरी और बतासे
15.चावल
16.टूल पट्टी
17.कलावा
18.लिफाफे कपड़ा पहनाने के
19.लिफाफे काजल के
20.चाचा-मामा, निगेहर (जमाई)
21.लाल थैली 
(नारियल,सुपारी,हल्दी,रेजगारी,चावल,मखाने)
22.माला फूल वाली
23.दाल चवाई बर्तन

"मण्डप"
1.हल्दी की गांठ-1नग
2.छोटी सुपारी-1नग
3.चावल-10ग्राम
4.सिक्का-1नग
5.लाल टूल कपड़ा
6.अशोक के पत्ते
7.लिफ़ाफ़े
8.लोटा
9.लठिया (बांस)
10.मिटटी भरा डिब्बा कनस्तर
11.सिल-लुढिया
12.पटली सेट

"भतइया"
1.ढरा
2.कॉपी
3.पैन
4.थाली
5.रेजगारी
6.निहाली बर्तन मिठाई सहित
7.पामड़े की धोती
8.शरबत,दूध या समयानुसार
9.वर पक्ष के पंच
10.वर पक्ष के परिवार के नाम

"बौहार"
1.छैलछबीली (चिरपुरी पत्ता) 5 रु.
2.हल्दी साबुत- 250 ग्राम
3.छोटी सुपारी- 250 ग्राम
4.काजू- 250 ग्राम
5.किशमिश- 250 ग्राम
6.छुआरे- 500 ग्राम
7.बादाम मिगी- 250 ग्राम
8.मखाने- 250 ग्राम
9.गोला- 11 नग
10.मिश्रीखूजा- 3 नग
11.चिरौंजी- 250 ग्राम
12.इलायची दाने- 1 किलो
13.बतासे 1 कनस्तर- 5 किलो
14.नारियल- 9 नग
15.मोहर-मोहरी
16.तोड़िया सेट (पायजेब)
17.भांवर की साड़ी सेट
18.पलंग की साड़ी सेट
19.पीली पट्टी - 1 मीटर
20. घाट चुनरी
21.पटली सेट
22.कलावा - 2 पिण्डी
23.चांद- 2 नग
24.तेल की शीशी छोटी- 1नग
25.पान सादा
26.धूप - 100 ग्राम
27.कपूर के पाउच -2 नग
28.माचिस - 1नग
29.हवन की लकड़ी-500 ग्राम
30.गृहस्थाचार्य (पंडित जी)
31.मिलनी परिजन-चाचा-मामा इत्यादि
32.बक्सा (अटैची)
33.विदा हेतु गाड़ी की व्यवस्था

"मंदिर का सामान"
34.चावल 1 कट्टा- 20 किलो
35.बादाम
36.लौंग
37.केसर
38.धोती-दुपट्टा
39.थाल
40.पथापरा
          """,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("जैसवाल एक परिचय")),

      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              """
उपरोंचिया दिगम्बर जैसवाल जैन समाज के 44 गोत्र

1. अगरैया
2.उचाड़िया
3. उन्नेरिया   
4. कठेरिया
5. कोटिया
6. कपरिया
7. कोलानायक
8. कुहेले
9. गढ़ा के शाह
10. गन्धी
11. घीया
12. चड़ोसिया
13. चिकनिया
14. चौरिया
15. जागड़ा
16. झारी के पाण्डिया
17. ठकुरिया
18. ढिलवारी
19. दनगसिया
20. धांगा
21. नायक
22. नाहरमूढा
23. पचगइयां
24. पचमेहरिया
25. पाण्डिया
26. पुनविया
27. पुरिया
28. पूणारावत
29. बघोरिया
30. बजाज
31. बरैठा
32. भण्डारी
33. मिड़ाखुरिया
34. मूंजी
35. मेंहतिया
36. महोरिया
37. रनपुरिया
38. रावत
39. लखेश्वरी
40. लोहरिया
41. साहबजाज
42. सुथनिया
43. संडा
44. साहुला
    
    """,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
