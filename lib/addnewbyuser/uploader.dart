import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/home/HomeScreen.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class Uploader extends StatefulWidget {
  final Uint8List file;
  final PersonalProfilewithc newprofie;

  Uploader( this.file, this.newprofie);

  createState() => _UploaderState(newprofie);
}

class _UploaderState extends State<Uploader> {
  final PersonalProfilewithc newprofile;
  //final FirebaseStorage _storage =
  //FirebaseStorage(storageBucket: 'gs://monaalcreation-13258.appspot.com');
  firebase_storage.UploadTask? _uploadTask;
  //List<String> result;

  _UploaderState(this.newprofile);

  void _startUpload() async {
    String _upimage =base64Encode(widget.file);

    setState(() {
      buttontitle="डाटा अपलोड किया जा रहा है";
    });
    await Firebase.initializeApp();
    String filepath = 'images/p-${DateTime.now()}.png';
        firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref().child(filepath);
    firebase_storage.UploadTask? uploadTask;

    firebase_storage.SettableMetadata metadata =
    firebase_storage.SettableMetadata(
      contentType: 'image/jpeg',
    );
    uploadTask = ref.putString(_upimage,
        format: firebase_storage.PutStringFormat.base64, metadata: metadata);


    setState(() {
      _uploadTask = uploadTask;
    });

    //firebase_storage.TaskSnapshot storageTaskSnapshot = await (await uploadTask).ref.;
    var downloadUrl = await(await uploadTask).ref.getDownloadURL();
    newprofile.PhotoLink1=downloadUrl.toString();

    String result = await saveprofile(newprofile);

    if(result=="200"){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("कार्य पूरा हुआ "),
              content: Container(
                height: 50,
                width: 30,
                child: Text("प्रोफाइल वेरिफिकेशन के लिए भेज दी गई है!"),
              ),
              actions: <Widget>[
                TextButton(
                    child: Text("वापस जाये"),
                    onPressed: () async{
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen()),(Route<dynamic>route)=>false);
                    }),
              ],
              elevation: 24,
            );
          });}
    else{
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("कार्य पूरा हुआ नहीं हुआ "),
              content: Container(
                height: 50,
                width: 30,
                child: Text("तकनिकी वजह से आपकी प्रोफाइल ऐड नहीं हुई है Error-code $result"),
              ),
              actions: <Widget>[
                TextButton(
                    child: Text("वापस जाये"),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen()),(Route<dynamic>route)=>false);
                    }),
              ],
              elevation: 24,
            );
          });

    }
  }
String buttontitle="डाटा अपलोड करे";
  @override
  Widget build(BuildContext context) {

      return Container(
          width: 10,
          child:
            ElevatedButton(child:Text(buttontitle),
            onPressed: _startUpload,
          ));
    }

}
