import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContactUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(150,110,110, 1),
        body: SafeArea(
          child: Container(
            height: MediaQuery. of(context). size. height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/appimages/appback.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
//                    foregroundColor: Color.fromRGBO(150,110,110, 1),
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/images/person/Pinnu.jpg',),
                  ),
                  Text(
                    'Priyanshu Jain',
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'APP DEVELOPER',
                    style: TextStyle(
                      fontFamily: 'SansCondensed',
                      fontSize: 20.0,
                      letterSpacing: 4.0,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 170.0,
                    child: Divider(
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 25.0,
                    ),
                    color: Color.fromRGBO(150,110,110, 1),
                    elevation: 7,
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        size: 23.0,
                        color: Colors.white,
                      ),
                      title: Text(
                        '+91 63-7763-3326',
                        style: TextStyle(
                          fontFamily: 'SansCondensed',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    elevation: 7,
                    margin: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 25.0,
                    ),
                    color: Color.fromRGBO(150,110,110, 1),
                    child: ListTile(
                      leading: Icon(
                        Icons.mail_outline,
                        size: 23.0,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Priyanshujain1221@gmail.com',
                        style: TextStyle(
                          fontFamily: 'SansCondensed',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }
}


