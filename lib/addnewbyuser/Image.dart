import 'dart:io';
import 'dart:typed_data';
import 'package:aprjnew/addnewbyuser/uploader.dart';
import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../Constants/app_color.dart';
import '../Constants/routedart.dart';

class Addimage extends StatefulWidget {
  final PersonalProfilewithc newprofile;
  const Addimage(this.newprofile, {Key? key}) : super(key: key);

  @override
  State<Addimage> createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  XFile? pickedFile;
  CroppedFile? croppedFileNew;
  Uint8List? imageBytes;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 25,
        maxHeight: 2000,
        maxWidth: 2000,
      );

      if (pickedFile != null) {
        await _cropImage();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _cropImage() async {
    if (pickedFile == null) return;

    try {
      // final cropped = await ImageCropper().cropImage(
      //   sourcePath: pickedFile!.path,
      //   compressFormat: ImageCompressFormat.jpg,
      //   compressQuality: 100,
      //   uiSettings: [
      //     AndroidUiSettings(
      //       toolbarTitle: 'Crop Image',
      //       toolbarColor: kPrimaryColor,
      //       toolbarWidgetColor: Colors.white,
      //       initAspectRatio: CropAspectRatioPreset.original,
      //       lockAspectRatio: false,
      //     ),
      //   ],
      // );

      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
      );

      if (cropped != null) {
        setState(() {
          croppedFileNew = cropped;
        });
        await uploadFile(0);
      }
    } catch (e) {
      print("Error cropping image: $e");
    }
  }

  Future<void> uploadFile(int num) async {
    try {
      if (croppedFileNew == null) return;

      File file = File(croppedFileNew!.path); // ✅ Convert CroppedFile to File
      Uint8List bytes = await file.readAsBytes();

      setState(() {
        imageBytes = bytes;
      });
    } catch (e) {
      print("Error uploading file: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    print("Profile Name: ${widget.newprofile.Name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("फोटो अपलोड")),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),

          /// Camera + Gallery buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: const Text('कैमरा शुरू करे'),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text('गैलरी से चुने'),
              ),
            ],
          ),

          const SizedBox(height: 20.0),

          /// Show Selected Image
          imageBytes == null
              ? Container(
                height: 300,
                width: 200,
                alignment: Alignment.center,
                child: const Text('No Image Selected'),
              )
              : Container(
                height: 500,
                width: 300,
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      width: 300,
                      child: Image.memory(imageBytes!, fit: BoxFit.cover),
                    ),
                    ElevatedButton(
                      onPressed: _cropImage,
                      child: const Icon(Icons.crop),
                    ),
                  ],
                ),
              ),

          const SizedBox(height: 20.0),

          /// Privacy policy section
          Column(
            children: [
              const Text(
                "डाटा अपलोड करने का मतलब आप हमारे सभी ",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              InkWell(
                child: const Text(
                  "नियम, शर्ते व प्राइवेसी पालिसी",
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 14),
                ),
                onTap: () {
                  Get.toNamed(AppRoute.privacypolicy);
                },
              ),
              const Text(
                "मानते है ",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 20.0),

          /// Uploader Widget
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 40.0,
            ),
            child:
                imageBytes == null
                    ? const Text("Select A photo")
                    : Uploader(imageBytes!, widget.newprofile),
          ),
        ],
      ),
    );
  }
}
