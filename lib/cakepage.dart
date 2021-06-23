import 'blowcandles.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'page_transition.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class CakePage extends StatefulWidget {
  @override
  _CakePageState createState() => _CakePageState();
}

class _CakePageState extends State<CakePage> {
  AudioPlayer cakeaudioPlayer;
  AudioCache cakeaudioCache;
  AudioPlayer backaudioPlayer;
  AudioCache backaudioCache;

  void Playsound() async{
    backaudioCache.loop('audio/backmusic.mp3',);
    cakeaudioCache.loop(
      'audio/cake.mp3',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    backaudioPlayer = new AudioPlayer();
    backaudioCache = new AudioCache(fixedPlayer: backaudioPlayer,);
    cakeaudioPlayer = new AudioPlayer();
    cakeaudioCache= new AudioCache(fixedPlayer: cakeaudioPlayer,);
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
              image: AssetImage("assets/images/appimages/cake.gif",),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: DelayedDisplay(
                  delay: Duration(seconds: 6),
                  child: GestureDetector(
                    onTap: (){
                      cakeaudioPlayer.stop();
                      Navigator.pushReplacement(context,
                        PageTransition(type:
                        PageTransitionType.fade,
                          child: BlowCandlePage(backplayer: backaudioPlayer,),),);
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
                          Text('Blow The',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400,letterSpacing: 4,fontFamily: 'SansCondensed'),),
                          Text('Candles',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 10,fontFamily: 'SansCondensed'),),
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
