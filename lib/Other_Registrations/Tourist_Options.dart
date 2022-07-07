import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Tourist_Registration.dart';
import 'Upload.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}



class Tourist_Option extends StatefulWidget {

  @override
  _Tourist_OptionState createState() => _Tourist_OptionState();
}

class _Tourist_OptionState extends State<Tourist_Option> {

  late Timer _timer;
  @override
  void initState() {
    super.initState();

    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    // EasyLoading.showSuccess('Use in initState');
    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tourist Place Registration"),
        ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.pinkAccent[200],
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Tourist_Reg()));
              }, child: Text("Tourist Place Registration",style:GoogleFonts.quicksand(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold),)),
 SizedBox(height: 20,),
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.pinkAccent[200],
                      padding: EdgeInsets.all(10)
                  ),
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadScreen()));
              }, child: Text("Select Images For Gallery",style:GoogleFonts.quicksand(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold),))

            ],
          ),
        ),
      ),
      );
  }
}
