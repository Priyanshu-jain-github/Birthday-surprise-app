import 'package:flutter/material.dart';
import 'lightsonpage.dart';
import 'page_transition.dart';
class LightsOffPage extends StatefulWidget {
  @override
  _LightsOffPageState createState() => _LightsOffPageState();
}

class _LightsOffPageState extends State<LightsOffPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context,
                PageTransition(type:
                PageTransitionType.fade,
                    child: LightsOnPage(),),);
          },
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(150,110,110, 1),
            radius: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Turn On',style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.w400,letterSpacing: 4,fontFamily: 'SansCondensed'),),
                Text('Lights',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold,letterSpacing: 10,fontFamily: 'SansCondensed'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
