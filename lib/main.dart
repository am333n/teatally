import 'package:flutter/material.dart';
import 'package:teatally/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teatally/core/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const MyApp());
}
