import 'package:flutter/material.dart';
import 'lightsoffpage.dart';
import 'potraitmode.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget with PortraitModeMixin  {
  const MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LightsOffPage(),
    );
  }
}


