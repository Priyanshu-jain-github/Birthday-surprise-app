import 'package:audioplayers/audioplayers.dart';
import 'cakepage.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'page_transition.dart';
import 'package:audioplayers/audio_cache.dart';

class LightsOnPage extends StatefulWidget {
  @override
  _LightsOnPageState createState() => _LightsOnPageState();
}

class _LightsOnPageState extends State<LightsOnPage> {
  AudioPlayer baloonaudioPlayer;
  AudioCache baloonaudioCache;
  void Playsound() async{

    baloonaudioCache.loop(
      'audio/baloon.mp3',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    baloonaudioPlayer = new AudioPlayer();
    baloonaudioCache= new AudioCache(fixedPlayer: baloonaudioPlayer);
    Playsound();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          height: MediaQuery. of(context). size. height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/appimages/baloon.gif",),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: DelayedDisplay(
              delay: Duration(seconds: 8),
              child: GestureDetector(
                onTap: (){
                  baloonaudioPlayer.stop();
                  Navigator.pushReplacement(context,
                    PageTransition(type:
                    PageTransitionType.fade,
                      child: CakePage(),),);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 150,),
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(150,110,110, 1),
                      radius: 115,
                      child: Center(child: Text('Here is Your Birthday Cake!!',textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.w400,fontFamily: 'SansCondensed',),)),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
