
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
class IndividualProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'HI');

ProfileController _profile=Get.find();
   return Scaffold(
     appBar: AppBar(title:Obx(()=>_profile.isLoading.value?Text("loading"):Text(_profile.individual.value.Name!+' Profile'))),
     body:Obx(()=>
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
         ListView(
         children: [
           Padding(padding: EdgeInsets.only(top:10),),
           Row(
            children: [
              Padding(padding: EdgeInsets.only(left:30),),
              Text(_profile.individual.value.Sno!,style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12) ,),
              Padding(padding: EdgeInsets.only(left:30),),
              Text(getmanglikstatus(_profile.individual.value.Manglik),style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12) ,),

             ],
           ),
           Divider(),
           Padding(padding: EdgeInsets.only(top:10),),

           Container(
             child: SizedBox(height:300,
             child: Image(image:NetworkImage(fetchImage(_profile.individual.value.PhotoLink1)!),height: 200,),),
           ),

           Padding(padding: EdgeInsets.only(top:20),),
           Card(
               child:Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:  Column(crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     //Padding(padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("नाम : "+_profile.individual.value.Name!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("पिताजी : "+_profile.individual.value.Father!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("माताजी : "+_profile.individual.value.Mother!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("आयु : "+getageondate(_profile.individual.value),style:TextStyle(fontSize: 12)),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("ऊँचाई : "+_profile.individual.value.Height!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("जन्म तिथि : "+_profile.individual.value.DateOfBirth!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("जन्म समय : "+_profile.individual.value.BirthTime!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("जन्म स्थान : "+_profile.individual.value.BirthPlace!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("स्वयं का गोत्र : "+getgotrainhindi(_profile.individual.value.GotraFather!)!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("मामा का गोत्र : "+getgotrainhindi(_profile.individual.value.GotraMother)!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("विशेष : "+_profile.individual.value.Quality!,style:TextStyle(fontSize: 12)),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("आय : ₹ "+format.format(_profile.individual.value.Income!),style:TextStyle(fontSize: 12)),
                     ),




                   ],
                 ),
               )
           ),


         /*  Card(
               child:Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start
                   ,children: [
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
                       Text(_profile.individual.value.Name!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12),),
                       Divider(thickness: 0.5,),
                       Text(_profile.individual.value.Father!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.Father!))),
                       Divider(thickness: 0.5,),
                       Text(_profile.individual.value.Mother!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.Mother!))),
                       Divider(thickness: 0.5,),
                       getageondate(_profile.individual.value),
                       Divider(thickness: 0.5,),
                       Text(_profile.individual.value.DateOfBirth!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                       Divider(thickness: 0.5,),
                       Text(_profile.individual.value.BirthTime!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                       Divider(thickness: 0.5,),
                       Text(_profile.individual.value.BirthPlace!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                       Divider(thickness: 0.5,),
                       Text(getgotrainhindi(_profile.individual.value.GotraFather)!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                       Divider(thickness: 0.5,),
                       Text(getgotrainhindi(_profile.individual.value.GotraMother)!,textAlign: TextAlign.left,style:TextStyle(fontSize: 12)),
                     ],
                   )


                 ],
                 ),
               )
           ),*/
           Card(
               child:Padding( padding: const EdgeInsets.all(8.0),
                 child: Row(
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
                         Text(_profile.individual.value.Qualification!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.Qualification!))),
                         Divider(thickness: 0.5,),
                         Text(_profile.individual.value.Profession!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.Profession!))),
                         Divider(thickness: 0.5,),
                         Text(getmultitext(_profile.individual.value.NameOfOrganisation)!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.NameOfOrganisation!))),
                         Divider(thickness: 0.5,),
                         Text(_profile.individual.value.Designation!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.Designation!))),
                         Divider(thickness: 0.5,),
                         Text(_profile.individual.value.WorkCity!,textAlign: TextAlign.left,style:TextStyle(fontSize: getfontsize(_profile.individual.value.WorkCity!)))
                       ],
                     )


                   ],
                 ),
               )
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
                               Center(child:Column(
                                 children: [
                                   Container(padding:EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                       child:Text("जानकारी प्राप्त करने के लिए",style: TextStyle(fontSize:15),)),
                                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Container(padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                         child:Text("1. श्री रूपेश जैन",style: TextStyle(fontSize:15),)),
                                     IconButton(onPressed: (){
                                       String url= "whatsapp://send?phone=+919999977294&text=कृपया मुझे प्रोफाइल ID: "+_profile.individual.value.Sno.toString()+" नाम: "+_profile.individual.value.Name.toString()+" पिताजी का नाम: "+
                                           _profile.individual.value.Father.toString()+" D O B :"+_profile.individual.value.DateOfBirth.toString() +" के संपर्क सूत्र की जानकारी दीजिये ! ";
                                       launchUrl(Uri.parse(url));
                                     }, icon: Icon(Icons.share,color: Colors.green,)),
                                     IconButton(onPressed: (){
                                       String url= "tel://+919999977294";
                                       launchUrl(Uri.parse(url));
                                     }, icon: Icon(Icons.call,color: Colors.black,))
                                   ],
                                 ),
                                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Container(padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                           child:Text("2. श्री अजय जैन",style: TextStyle(fontSize:15),)),
                                       IconButton(onPressed: (){
                                         String url= "whatsapp://send?phone=+919425764033&text=कृपया मुझे प्रोफाइल ID: "+_profile.individual.value.Sno.toString()+" नाम: "+_profile.individual.value.Name.toString()+" पिताजी का नाम: "+
                                             _profile.individual.value.Father.toString()+" D O B :"+_profile.individual.value.DateOfBirth.toString() +" के संपर्क सूत्र की जानकारी दीजिये ! ";
                                         launchUrl(Uri.parse(url));
                                       }, icon: Icon(Icons.share,color: Colors.green,)),
                                       IconButton(onPressed: (){
                                         String url= "tel://+919425764033";
                                         launchUrl(Uri.parse(url));
                                       }, icon: Icon(Icons.call,color: Colors.black,))
                                     ],
                                   ),
                                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Container(padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                           child:Text("3. श्री रविन्द्र जैन",style: TextStyle(fontSize:15),)),
                                       IconButton(onPressed: (){
                                         String url= "whatsapp://send?phone=+919826365877&text=कृपया मुझे प्रोफाइल ID: "+_profile.individual.value.Sno.toString()+" नाम: "+_profile.individual.value.Name.toString()+" पिताजी का नाम: "+
                                             _profile.individual.value.Father.toString()+" D O B :"+_profile.individual.value.DateOfBirth.toString() +" के संपर्क सूत्र की जानकारी दीजिये ! ";
                                         launchUrl(Uri.parse(url));
                                       }, icon: Icon(Icons.share,color: Colors.green,)),
                                       IconButton(onPressed: (){
                                         String url= "tel://+919826365877";
                                         launchUrl(Uri.parse(url));
                                       }, icon: Icon(Icons.call,color: Colors.black,))
                                     ],
                                   ),
                                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Container(padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                           child:Text("4. श्री अनिल जैन ",style: TextStyle(fontSize:15),)),
                                       IconButton(onPressed: (){
                                         String url= "whatsapp://send?phone=+919413037563&text=कृपया मुझे प्रोफाइल ID: "+_profile.individual.value.Sno.toString()+" नाम: "+_profile.individual.value.Name.toString()+" पिताजी का नाम: "+
                                             _profile.individual.value.Father.toString()+" D O B :"+_profile.individual.value.DateOfBirth.toString() +" के संपर्क सूत्र की जानकारी दीजिये ! ";
                                         launchUrl(Uri.parse(url));
                                       }, icon: Icon(Icons.share,color: Colors.green,)),
                                       IconButton(onPressed: (){
                                         String url= "tel://+919413037563";
                                         launchUrl(Uri.parse(url));
                                       }, icon: Icon(Icons.call,color: Colors.black,))
                                     ],
                                   ),




                                 ],
                               )),
                               /*ElevatedButton(onPressed: (){
                                 //sendMessage("hello");

                                 String url= "whatsapp://send?phone=+918755076202&text=कृपया मुझे प्रोफाइल ID: "+_profile.individual.value.Sno.toString()+" नाम: "+_profile.individual.value.Name.toString()+" पिताजी का नाम: "+
                                     _profile.individual.value.Father.toString()+" D O B :"+_profile.individual.value.DateOfBirth.toString() +" के संपर्क सूत्र की जानकारी दीजिये ! ";
                                 launchUrl(Uri.parse(url));
                               }, child: Text("व्हाट्सप्प पर सूचित करने के लिए यहाँ दबाएं",textAlign: TextAlign.center,))*/
                             ])
                     ),


                   );

                 });


           }, child:Align(alignment: Alignment.center,
           child:Text("इस प्रोफाइल के संपर्क सूत्र की जानकारी प्राप्त करने के लिए यहाँ दबाएं ",textAlign: TextAlign.center,)         ))),
           TextButton(onPressed: (){
             DialogHelper.instance.reportflagconfirm(context,_profile.individual.value.Sno!);
             }, child: Text("Report this profile/user")),
           TextButton(onPressed: (){
             DialogHelper.instance.blockconfirm(context,_profile.individual.value.Sno!);
           }, child: Text("Block this profile/user")),
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
           ),*/
           SizedBox(height: 100,width: 300,),//Advertisement Box

         ],

       ),
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


void sendMessage(String text) {
  var txt = text;
  _launchURL(txt);
}
var _url = "https://api.whatsapp.com/send?phone=919999977294";
void _launchURL(txt) async => await canLaunch(_url)
    ? await launch(_url)
    : throw 'Could not launch $_url';

String? getmultitext(text) {
  int length=text.length;
  if(length>18)
    {
      return text.substring(0,18)+"\n-"+text.substring(18,length);
    }
  else
    return text;
}

getfontsize(String father) {
  if(father.length>=14){
    return 12.0;
  }
  else
    return 12.0;

}

String? getstatename(country) {
  switch (country){
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
  switch(gotraFather)
  {
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
  if(manglikstatus=="0"){
    return "नॉन मांगलिक";

  }
  else if(manglikstatus=="1"){
    return "मांगलिक";
  }
  else{
    return"आंशिक मांगलिक";
  }

}

getageondate(PersonalProfilewithc personalProfilewithc){
  final df = new DateFormat('dd/MMM/yyyy');
  var outputFormat = DateFormat('dd/MM/yyyy');
  var outputDate = outputFormat.parse(personalProfilewithc.DateOfBirth!);
  print(personalProfilewithc.Name!);
  print(personalProfilewithc.DateOfBirth);
  print(outputDate);
  //print(DateTime.parse(personalProfilewithc.DateOfBirth!));
  return calculateAge(outputDate)+ " वर्ष";

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



