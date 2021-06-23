import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'memoryLane.dart';
import 'moodbox.dart';
import 'contactus.dart';
import 'package:audioplayers/audio_cache.dart';

class MainPage extends StatefulWidget {
  MainPage({this.backplayer});
  final backplayer;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 210, 205, 1),

      body:[
        MoodBox(),
        HomePage(audioPlayer: widget.backplayer),
        MemoryLane(),
        ContactUs(),
      ].elementAt(_selectedIndex) ,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(235, 210, 205, 1),
        ),
        child: BottomNavigationBar(
          elevation: 7,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedItemColor:  Color.fromRGBO(150,110,110, 1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.mood),
                title: Text("Mood Box") ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bubble_chart),
                title: Text("Wishes") ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text("Memory Lane") ),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone),
                title: Text("Contact Us") )
          ],
          onTap: _onBarItemTap,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
  void _onBarItemTap(int value){
    setState(() {
      _selectedIndex = value;
    });
  }
}
