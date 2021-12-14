import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'material_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DinoApp());
}

