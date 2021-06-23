import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';

class MoodBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(

      child: Scaffold(
        backgroundColor: Color.fromRGBO(150,110,110, 1),
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
                            color: Colors.blueGrey[900],
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
                            color: Colors.blueGrey[900],
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
                            color: Colors.blueGrey[900],
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
          height: MediaQuery. of(context). size. height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/appimages/appback.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: StreamBuilder(
            stream: Firestore.instance.collection('moods').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator())));
              }
              return GridView.count(
                padding: EdgeInsets.all(6),
                shrinkWrap: true,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data.documents.length,
                  (index) {
                    return FlipCard(
                      direction: FlipDirection.VERTICAL, // default
                      front: Card(
                        elevation: 7,
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/appimages/cardback.jpg',
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(height:width*0.0194),
                                  CircleAvatar(
                                    radius: width*0.138888,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage('assets/images/moods/${snapshot.data.documents[index].data['Name']}.jpg'),
                                  ),
                                  SizedBox(
                                    height: width*0.01388,
                                  ),
                                  Text(
                                    snapshot.data.documents[index].data['Quote'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontSize: 17,
                                      fontFamily: 'SansCondensed',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      back: Card(
                        elevation: 7,
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/appimages/cardback.jpg',
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 6,left: 4,right: 4,bottom: 0),
                                  child: Text(
                                    snapshot.data.documents[index].data['Advice'],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
