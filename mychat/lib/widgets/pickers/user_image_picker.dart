import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _image;
  final _picker = ImagePicker();
  void _pickImage() async {
    final _pickedImageFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      if (_pickedImageFile != null) {
        _image = File(_pickedImageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image == null ? null : FileImage(_image),
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.add_a_photo),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
