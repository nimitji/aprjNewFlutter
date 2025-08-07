
import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/profiles/IndividualProfile.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ProfileList extends StatelessWidget {
  final String? gender,mstatus;
  final List<PersonalProfilewithc>? personalprofiles;


  const ProfileList({Key? key, this.personalprofiles, this.gender, this.mstatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("Profiles"),
              floating: false,
              pinned: false,



            ),


            getlist()
          ],

        )



    );
  }


  getlist() {
    print(personalprofiles!.length);
    //print("builder called");
    //print(personalprofiles);
    return// Create a SliverList.
      SliverList(
        // Use a delegate to build items as they're scrolled on screen.
        delegate: SliverChildBuilderDelegate(
          // The builder function returns a ListTile with a title that
          // displays the index of the current item.
              (context, index) => Stack(
                    children: [
                      Container(
                          child: InkWell(
                              onTap: () {
                                /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndividualProfile(
                                      personalProfile: personalprofiles[index],
                                    )));*/
                              },
                              child: Container(
                                  color: Colors.red,
                                  height: 550,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 10.0,
                                  ),
                                  child: Container(
                                    color: Colors.purple,
                                    child: Card(
                                        margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                                        child: Column(
                                          children: [
                                            Row(children: [
                                              Expanded(child:Container(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                child: Text(
                                                  personalprofiles![index].Name!+" "+"("+personalprofiles![index].Sno!+")",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.red,
                                                      fontSize: 21),
                                                ),
                                              ),)


                                            ],
                                            ),
                                            Divider(thickness: 2,color: Colors.red,),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      child: Row(
                                                        children: [SizedBox(width: 5,),
                                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                formatString(
                                                                    "नाम")!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),


                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text("पिताजी",
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                "माताजी",
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text("जन्म दिनांक",
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text("जन्म समय",
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text("जन्म स्थान",
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                formatString(
                                                                    personalprofiles![index].Name)!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                "श्री "+personalprofiles![index].Father!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                formatString(
                                                                    "श्रीमति "+personalprofiles![index].Mother!)!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                formatString(
                                                                    personalprofiles![index].DateOfBirth)!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(formatString(personalprofiles![index].BirthTime)!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                formatString(
                                                                    personalprofiles![index].BirthPlace)!,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                Container(
                                                  height: 180,
                                                  width: 130,
                                                  color: Colors.red,
                                                  child:
                                                  Container(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: 5.0, horizontal: 3.0),
                                                      height: 200,
                                                      width: 130,
                                                      child: Image(
                                                        image: NetworkImage(fetchImage(
                                                            personalprofiles![index]
                                                                .PhotoLink1)),
                                                        height: 200,
                                                        fit: BoxFit.fill,
                                                      )),
                                                ),

                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SizedBox(width: 5,),
                                                Column(crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      formatString(
                                                          "व्यवसाय")!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),


                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("कार्यरत संस्था",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "शिक्षा",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("पद",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("शहर",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("ऊंचाई",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      personalprofiles![index].Profession!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      personalprofiles![index].NameOfOrganisation!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(

                                                      personalprofiles![index].Qualification!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      personalprofiles![index].Designation!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(

                                                      personalprofiles![index].WorkCity!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(

                                                      personalprofiles![index].Height!+" ft.",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15,),
                                          /*  SizedBox(height: 45,

                                                child:
                                                ElevatedButton(
                                                    onPressed: (){
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => IndividualProfile(
                                                             personalprofiles![index],
                                                              )));
                                                    },
                                                    style:ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple) ), // background
                                                    child:Text("अधिक जानकारी के लिए यहाँ क्लिक करे ",style:
                                                    TextStyle(color:Colors.white),)

                                                )
                                            ),*/



                                          ],
                                        )),
                                  )



                              )
                          )),
                    ],
                  ),

         // Builds 1000 ListTiles
          childCount: personalprofiles!.length,
        ),
      );

  }





  fetchImage(String? photoLink1) {
    if (photoLink1 == "NA") {
      return "https://nprservices.in/catalogue/APRJ/notavail.png";
    }
    else
      return photoLink1;
  }

  String? formatString(String? designation) {
    if (designation != "NA") {
      if (designation!.length < 17) {
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
    if (name.length < 13) {
      return name;
    }
    else {
      return name.substring(0, 13) + '..';
    }
  }

  String getgender() {
    if(gender=="F"){
      return "Female";
    }else{
      return "Male";
    }
  }

}


class FilteredProfileone extends StatefulWidget {

  final String manglikstatus, gender, title;
  FilteredProfileone(this.manglikstatus, this.gender, this.title);

  @override
  _FilteredProfileoneState createState() => _FilteredProfileoneState(manglikstatus, gender,
      title);
}

class _FilteredProfileoneState extends State<FilteredProfileone> {
  bool issearching=false;
  List<PersonalProfilewithc>? profiles=[];
  List<PersonalProfilewithc> fileredprofiles=[];
  final String manglikstatus, gender, title;

  _FilteredProfileoneState(this.manglikstatus, this.gender, this.title);


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        children: [

          FutureBuilder(
              future: getquerywithc(manglikstatus, gender),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  print(snapshot.error);
                return snapshot.hasData
                    ? _setState(snapshot.data)
                    : Center(child: CircularProgressIndicator(),);
              }

          ),
          ],


      )





    );
  }

  fetchprofile() {
    if(!issearching){
      return profiles;
    }
    return fileredprofiles;
  }

  _setState(data) {
    profiles=data;
    return (ProfileList(personalprofiles: fetchprofile(),gender:gender,mstatus: manglikstatus));
  }


}



