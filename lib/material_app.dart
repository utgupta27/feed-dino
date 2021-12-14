import 'package:flutter/material.dart';

import 'home_page.dart';

class DinoApp extends StatefulWidget {
  const DinoApp({Key? key}) : super(key: key);

  @override
  _DinoAppState createState() => _DinoAppState();
}

class _DinoAppState extends State<DinoApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Feed the Dino",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
