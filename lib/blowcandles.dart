import 'mainpage.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'page_transition.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class BlowCandlePage extends StatefulWidget {
  BlowCandlePage({this.backplayer});
  final backplayer;
  @override
  _BlowCandlePageState createState() => _BlowCandlePageState();
}

class _BlowCandlePageState extends State<BlowCandlePage> {
  AudioPlayer blowaudioPlayer;
  AudioCache blowaudioCache;
  void Playsound() async{

    blowaudioCache.loop(
      'audio/blowcandle.mp3',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    blowaudioPlayer = new AudioPlayer();
    blowaudioCache= new AudioCache(fixedPlayer: blowaudioPlayer);
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
              image: AssetImage("assets/images/appimages/blowcandle.gif"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: DelayedDisplay(
                  delay: Duration(seconds: 9),
                  child: GestureDetector(
                    onTap: (){
                      blowaudioPlayer.stop();
                      Navigator.pushReplacement(context,
                        PageTransition(type:
                        PageTransitionType.fade,
                          child: MainPage(backplayer: widget.backplayer,),),);
                    },
                    child: Container(
                      height: 110,
                      padding: EdgeInsets.symmetric(vertical: 9,horizontal: 12),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(150,110,110, 1),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Here is Your',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400,letterSpacing: 4,fontFamily: 'SansCondensed'),),
                          Text('Surprise',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 10,fontFamily: 'SansCondensed'),),
                        ],
                      ),
                    ),


//                    CircleAvatar(
//                      backgroundColor: Color.fromRGBO(150,110,110, 1),
//                      radius: 95,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text('Blow The',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400,letterSpacing: 4,fontFamily: 'SansCondensed'),),
//                          Text('Candles',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 10,fontFamily: 'SansCondensed'),),
//                        ],
//                      ),
//                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
            ],
          )),
    );
  }
}
