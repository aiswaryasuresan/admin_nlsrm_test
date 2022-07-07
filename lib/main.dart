//@dart=2.9

import 'package:flutter/material.dart';
import 'Main_Files/Admin_Splashscreen.dart';
// import 'Main_Files/Splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminSplash_screen(),
    );
  }
}
