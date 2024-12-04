import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmport/app/app.dart';
import 'package:mmport/app/core/injection_container.dart';
import 'package:mmport/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


