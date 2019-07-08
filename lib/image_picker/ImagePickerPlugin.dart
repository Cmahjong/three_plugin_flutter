import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final String EXTRA_DATA = "EXTRA_DATA";

class ImagePickerPlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagePickerPluginState();
  }
}

class ImagePickerPluginState extends State<ImagePickerPlugin> {
  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Builder(
              builder: (ctx) => FlatButton(
                  onPressed: () {
                    imagePicker();
                  },
                  child: Text("图片选择"))),
         Expanded(child: _image==null?Text("请先选择图片"): Image.file(_image))
        ],
      ),
    );
  }

  void imagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
