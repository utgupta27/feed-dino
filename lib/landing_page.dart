import 'dart:io';

import 'package:feed_dino/message_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool clicked = false;
  AssetImage cam = const AssetImage("assets/cam_icon.png");
  AssetImage done = const AssetImage("assets/done.png");
  File? _image;

  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  toggleClick() {
    setState(() {
      clicked = !clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 30),
                child: InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    height: 45,
                    width: 45,
                    child: const Image(image: AssetImage("assets/Arrow 1.png")),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          Container(
            color: Colors.red,
            height: 180,
            width: 300,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 244, 244),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: SizedBox(
                    width: 300,
                    height: 275,
                    child: Stack(
                      children: [
                        Center(
                            child: _image == null
                                ? const Image(
                                    image: AssetImage("assets/Plate.png"))
                                : Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(_image!)),
                                    ),
                                  )),
                        const Center(
                            child:
                                Image(image: AssetImage("assets/Corners.png"))),
                        const Center(
                            child:
                                Image(image: AssetImage("assets/Cutlery.png"))),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Click Your Meal",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 64,
                      width: 64,
                      child: Image(image: clicked ? done : cam),
                    ),
                    onTap: () {
                      if (clicked == false) {
                        getImage();
                      }
                      if (clicked == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MessagePage()));
                      }
                      toggleClick();
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
