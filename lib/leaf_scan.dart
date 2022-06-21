// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tflite/tflite.dart';

class LeafScan extends StatefulWidget {
  final String modelName;
  //parameters passed from home screen
  const LeafScan({Key? key, required this.modelName}) : super(key: key);

  @override
  State<LeafScan> createState() => _LeafScanState(modelName);
}

class _LeafScanState extends State<LeafScan> {
  String modelName;
  _LeafScanState(this.modelName);

  File? pickedImage;
  bool isButtonPressedCamera = false;
  bool isButtonPressedGallery = false;
  Color backgroundColor = Color(0xffe9edf1);
  Color secondaryColor = Color(0xffe1e6ec);
  Color accentColor = Color(0xff2d5765);

  List? results;
  String confidence = "";
  String name = "";

  String ModelPathSelector() {
    if (modelName.toLowerCase() == "apple")
      return 'models/Apple';
    else if (modelName.toLowerCase() == "bellpepper")
      return 'models/Bell\ Pepper';
    else if (modelName.toLowerCase() == "cherry")
      return 'models/Cherry';
    else if (modelName.toLowerCase() == "corn")
      return 'models/Corn';
    else if (modelName.toLowerCase() == "grape")
      return 'models/Grape';
    else if (modelName.toLowerCase() == "peach")
      return 'models/Peach';
    else if (modelName.toLowerCase() == "potato")
      return 'models/Potato';
    else if (modelName.toLowerCase() == "rice")
      return 'models/Rice';
    else if (modelName.toLowerCase() == "tomato")
      return 'models/Tomato';
    else
      return "";
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
          isButtonPressedCamera = false;
          isButtonPressedGallery = false;
        });
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void buttonPressedCamera() {
    setState(() {
      isButtonPressedCamera = !isButtonPressedCamera;
      getImage(ImageSource.camera);
    });
  }

  void buttonPressedGallery() {
    setState(() {
      isButtonPressedGallery = !isButtonPressedGallery;
      getImage(ImageSource.gallery);
    });
  }

  @override
  void initState() {
    super.initState();
    print(modelName);
    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    closeModel();
  }

  loadModel() async {
    String modelPath = ModelPathSelector();
    print(modelPath);
    var resultant = await Tflite.loadModel(
        model: modelPath + "/model_unquant.tflite",
        labels: modelPath + "/labels.txt");

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

  void closeModel() async {
    await Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      systemNavigationBarColor: secondaryColor,
    ));

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          //todo implement transition to other screens
          print(index);
        },
        index: 1,
        backgroundColor: backgroundColor,
        color: secondaryColor,
        buttonBackgroundColor: backgroundColor,
        animationDuration: Duration(
          milliseconds: 300,
        ),
        items: [
          NeumorphicIcon(
            Icons.menu_book_rounded,
            style: NeumorphicStyle(
              color: accentColor,
              intensity: 20,
            ),
          ),
          NeumorphicIcon(
            Icons.home_rounded,
            style: NeumorphicStyle(
              color: accentColor,
              intensity: 20,
            ),
          ),
          NeumorphicIcon(
            Icons.info_rounded,
            style: NeumorphicStyle(
              color: accentColor,
              intensity: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.blue[900],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/app_icon.svg',
                          width: 30,
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "AgroLab",
                            style: TextStyle(
                              fontFamily: 'odibeeSans',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/tensorflow-icontext.svg',
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
              Center(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    border: NeumorphicBorder(
                      color: accentColor,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          )
                        : LottieBuilder.asset(
                            'assets/39771-farm.json',
                            width: 300,
                            height: 300,
                          ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NeumorphicButton(
                      tooltip: 'Camera',
                      style: NeumorphicStyle(
                        color: Color(0xffe9edf1),
                        intensity: 10,
                      ),
                      pressed: isButtonPressedCamera,
                      onPressed: buttonPressedCamera,
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_rounded,
                            size: 40,
                            color: accentColor,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    NeumorphicButton(
                      tooltip: 'Gallery',
                      style: NeumorphicStyle(
                        color: Color(0xffe9edf1),
                        intensity: 10,
                      ),
                      pressed: isButtonPressedGallery,
                      onPressed: buttonPressedGallery,
                      child: Column(
                        children: [
                          Icon(
                            Icons.image_rounded,
                            size: 40,
                            color: accentColor,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: backgroundColor,
                    lightSource: LightSource.topLeft,
                    intensity: 20,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(10)),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                confidence,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
