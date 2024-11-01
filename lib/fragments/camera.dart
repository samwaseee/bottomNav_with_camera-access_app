import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? photo;
  final ImagePicker picker = ImagePicker();

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 100);

    setState(() {
      pickedFile != null
          ? photo = File(pickedFile.path)
          : print("no image selected");
    });
  }

  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 100);

    setState(() {
      pickedFile != null
          ? photo = File(pickedFile.path)
          : print("no image selected");
    });
  }

  void showBottomSheetDialouge(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () {
                  imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_outlined),
                title: Text("Gallery"),
                onTap: () {
                  imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        photo != null
            ? Image.file(photo!,
                width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth)
            : Image.asset(
                "assets/images/placeholder.jpeg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            showBottomSheetDialouge(context);
          },
          child: const Text(
            "Pick Image",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
