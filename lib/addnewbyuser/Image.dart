import 'dart:io';
import 'dart:typed_data';
import 'package:aprjnew/addnewbyuser/uploader.dart';
import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/app_color.dart';
import '../Constants/routedart.dart';
import '../classes/PersonalProfilewithcontact.dart';


class Addimage extends StatefulWidget{
  final PersonalProfilewithc newprofile;
  Addimage(this.newprofile);
  @override
  _addnewimagestate createState()=>_addnewimagestate(newprofile);

}



class _addnewimagestate extends State<Addimage> {

  final PersonalProfilewithc newprofile;
  XFile? pickedfile;
  var croppedfilenew;
  Uint8List? imagebyte;
  //var croppedFile=CroppedFile("");
  final picker=ImagePicker();

  _addnewimagestate(this.newprofile);

  Future _pickImage(ImageSource source)async{
    print("pick image");
    print(newprofile);
    pickedfile=await picker.pickImage(source: source,imageQuality: 25,maxHeight: 2000,maxWidth: 2000);
    _cropImage();



  }

  Future<Null> _cropImage() async {
    if (pickedfile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedfile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        croppedfilenew = croppedFile;
        setState(() {
          croppedfilenew = croppedFile;
        });
        uploadFile(0);
      }
    }

  }

  Future<void> uploadFile(int num) async {//0 for top, 1 for bottom, 2 for left,3 for right,4 for front 5 for back
    print("uploadfile $num");
    switch(num){
      case 0 :
      //print(image.value);
        await croppedfilenew.readAsBytes().then((value)=>{
          imagebyte =value
        });
    break;
    }

  }


  /*Future<void> _pickImage(ImageSource source) async{
    File selected=await ImagePicker.pickImage(source: source,maxHeight: 500,maxWidth: 500);

       setState(() {
      _imagefile=selected;
    });
  }*/

@override
  void initState() {
    print(widget.newprofile.Name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("फोटो अपलोड"),

      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ElevatedButton(
                onPressed:()=> _pickImage(ImageSource.camera),
                child: Text('कैमरा शुरू करे '),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed:()=> _pickImage(ImageSource.gallery),
                child: Text('गैलरी से चुने '),
              )
            ],
          ),
          imagebyte == null
              ? Container(height:300, width: 200,child:Center(child:Text('No Image Selected')))
              :Container(
              height:500,
              width: 300,
              child:
                  Column(
                    children:[
                      Container(height: 400,width: 300,
                        child:Center(child:Image.memory(imagebyte!)),

                      ),


                      ElevatedButton(
                        onPressed:(){_cropImage();}, /*_cropImage()*/
                        child: Icon(Icons.crop),
                      )
                    ])),

          Column(
            children: [
              SizedBox(height: 20.0),
              Container(height: 20,
                  child: Text("डाटा अपलोड करने का मतलब आप हमारे सभी ",
                    style: TextStyle(color: Colors.black,fontSize: 14),)),
              Container(
                child:InkWell( child: Text("नियम, शर्ते व प्राइवेसी पालिसी",
                  style: TextStyle(color: Colors.indigoAccent,fontSize: 14),),
                  onTap:(){
                    Get.toNamed(AppRoute.privacypolicy);
                  },

                ),
              ),
              Container(
                  child: Text("मानते है ",
                    style: TextStyle(color: Colors.black,fontSize: 14),)),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 40.0),
              child:
              imagebyte==null?
              Text("Select A photo"):
              Uploader(imagebyte!,newprofile)),
        ],
      ),

    );
  }

  /*void printit(PersonalProfilewithc newprofile) {
    print("Manglik "+newprofile.Manglik);
    print("Name "+newprofile.Name);
    print("Age "+newprofile.Age);
    print("GM "+newprofile.GotraMother);
    print("GF "+newprofile.GotraFather);
    print("Profession "+newprofile.Profession);
  }*/
}

