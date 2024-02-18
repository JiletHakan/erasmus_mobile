import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_erasmus/firebase_options.dart';
import 'package:mobile_erasmus/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_erasmus/screens/styles.dart';
//import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: AppStyles.appTheme,
      home: const StartScreen(),
    ),
  );
}
