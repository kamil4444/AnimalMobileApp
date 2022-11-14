// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class ImagePickerClass extends StatefulWidget {
  const ImagePickerClass({Key? key, required this.typ}) : super(key: key);
  final String typ;
  @override
  State<StatefulWidget> createState() => _ImagePickerClass();
}

class _ImagePickerClass extends State<ImagePickerClass> {
  var _image;
  var imagePicker;
  var type;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  void pickImage() async {
    var source = type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    XFile image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    setState(() {
      _image = File(image.path);
    });
  }

  // Building pop-up box to pick an image (from gallery or camera)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => AlertDialog(
              content: Text(
                'Ustaw swoje zdjęcie',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              actions: [
                TextButton(
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      type = ImageSourceType.camera;
                      Navigator.pop(context);
                      pickImage();
                    },
                    child: Text(
                      'Zrób teraz',
                      style: Theme.of(context).textTheme.headline3,
                    )),
                TextButton(
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      type = ImageSourceType.gallery;
                      Navigator.pop(context);
                      pickImage();
                    },
                    child: Text(
                      'Galeria',
                      style: Theme.of(context).textTheme.headline3,
                    ))
              ],
            )), //OnTap
        child: _image != null
            ? Stack(alignment: Alignment.bottomRight, children: [
                CircleAvatar(
                    backgroundImage: FileImage(_image),
                    radius: MediaQuery.of(context).size.height * .1),
                const Icon(Icons.edit),
              ])
            : Image.asset(type));
  }
}
