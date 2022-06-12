import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? pickedImage;
  List? results;
  String confidence = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        final imageTemporary = File(image.path);
        setState(() {
          pickedImage = imageTemporary;
          applyModelOnImage(pickedImage!);
        });
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  loadModel() async {
    var resultant = await Tflite.loadModel(
        model: "models/dogs_and_cats.tflite",
        labels: "models/labels.txt");

    print("Result after loading model: $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      results = res!;
      print(results);
      String str = results![0]["label"];
      name = str.substring(2);
      confidence = results != null
          ? (results![0]["confidence"] * 100.0).toString().substring(0, 5) + "%"
          : "";
      print(name);
      print(confidence);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Disease Identifier"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pickedImage != null
              ? Image.file(
                  pickedImage!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://c.s-microsoft.com/en-us/CMSImages/1920_Panel01_PriorityFeature_AIO.jpg?version=d00cfd4a-79e3-44f9-f40c-d159e4e89a9d",
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
          ElevatedButton(
            onPressed: () => getImage(ImageSource.gallery),
            child: Text("Gallery"),
          ),
          ElevatedButton(
            onPressed: () => getImage(ImageSource.camera),
            child: Text("Camera"),
          ),
        ],
      ),
    );
  }
}
