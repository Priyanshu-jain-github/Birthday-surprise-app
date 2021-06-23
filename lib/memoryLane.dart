import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';

class MemoryLane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(150, 110, 110, 1),
          appBar: PreferredSize(
              child: AppBar(
                elevation: 0,
                title: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Happy',
                          style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontFamily: 'SansCondensed',
                              fontSize: 19),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 21,
                        ),
                        Text(
                          'Birthday',
                          style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontFamily: 'GreatVibes',
                              fontSize: 28),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 38,
                        ),
                        Text(
                          'Arshiya',
                          style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontFamily: 'SansCondensed',
                              fontSize: 19),
                        ),
                      ],
                    ),
                  ],
                ),
                flexibleSpace: Image(
                  image: AssetImage('assets/images/appimages/appbar.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                backgroundColor: Colors.transparent,
              ),
              preferredSize: Size.fromHeight(78)),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/appimages/appback.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Card(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/memorylane/${index+1}.jpeg',
                      fit: BoxFit.fitWidth,
                    ),
                    elevation: 0,
                  ),
                );
              },
              itemCount: 13,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          )),
    );
  }
}
