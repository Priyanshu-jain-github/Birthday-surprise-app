import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

class WishPage extends StatelessWidget {
  WishPage({this.nickName, this.name, this.wish,this.audio});
  String nickName, name, wish;
  bool audio;
  int value;
  void Playsound() {
    final Player = AudioCache();
    Player.play(
      'audio/$name.mp3',
    );
  }
  int _index=0;
  @override
  Widget build(BuildContext context) {
    value = Random().nextInt(40) + 1;
//    print(value);


    return SafeArea(

      child: Scaffold(
        backgroundColor: Color.fromRGBO(150, 110, 110, 1),

        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back/$value.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
//        floatingActionButton: Container(
//          width: 80,
//          height: 45,
//          child: FloatingActionButton(
//            elevation: 7,
//            backgroundColor:
//            Color.fromRGBO(150,110,110, 1),
////            Color.fromRGBO(153, 205, 205, 1),
//            onPressed: ()  {
//
//            },
//            tooltip: 'Increment',
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(10),
//                    topRight: Radius.circular(10),
//                    bottomLeft: Radius.circular(10),
//                    bottomRight: Radius.circular(10))),
//            child: Container(
//                child: Center(
//                    child:Icon(Icons.card_giftcard,size: 40,))),
//          ),
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


            backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              child: AppBar(
                elevation: 0,
                title: Row(
                  children: <Widget>[
                    SizedBox(width: 15,),

                    Column(
                      children: <Widget>[
                        SizedBox(height: 25,),
                        Text(
                          nickName,
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontFamily: 'GreatVibes',
                              fontSize: 30),
                        ),
                      ],
                    ),

                  ],
                ),
                flexibleSpace: Image(
                  image: AssetImage('assets/images/appimages/appbar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              preferredSize: Size.fromHeight(78)),
//      appBar: AppBar(
//        elevation: 1,
//        backgroundColor: Colors.white,
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios),
//          color: Colors.black,
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//        title: Text(
//          nickName,
//          style: TextStyle(color: Colors.black),
//        ),
//      ),
            body: SingleChildScrollView(
              child: Container(


                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//                  SizedBox(height: 60,),
                    audio == true ? GestureDetector(
                      onTap: (){
                        Playsound();

                      },
                      child: Card(
                        elevation: 8,
                        child: Container(
                          height: 100,
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/appimages/audiocardback.jpg',
                                fit: BoxFit.cover,
                              ),
//                          Center(
//                            child: Text(
//                              'TAP HERE !!',style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 30
//                            ),
//                            ),
//                          ),
                            ],
                          ),
                        ),
                      ),
                    ): Container(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        child: Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5,right: 65,left: 5),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

                                Material(
                                  elevation: 7.0,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                  color:  Color.fromRGBO(150,110,110, 1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 15.0),
                                    child: Text(
                                      wish,
                                      style: TextStyle(
                                          color:  Colors.white,
                                          fontFamily: 'DancingScript',
                                          fontSize: 25.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
