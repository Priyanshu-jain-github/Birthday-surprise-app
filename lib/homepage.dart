import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'wishpage.dart';


class HomePage extends StatefulWidget {
  HomePage({this.audioPlayer});
  final audioPlayer;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void Stopsound(){

    widget.audioPlayer.stop();
  }
@override
//  void initState() {
//    // TODO: implement initState
//
//    super.initState();
//  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(width);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
        Stopsound();

        },
          backgroundColor: Color.fromRGBO(150,110,110, 1),
        child:  Icon(Icons.volume_off) ,),
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

        backgroundColor: Colors.transparent,

        body: Container(
          height: MediaQuery. of(context). size. height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/appimages/appback.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: StreamBuilder(
            stream: Firestore.instance.collection('wishes').snapshots(),
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WishPage(
                              wish:
                                  snapshot.data.documents[index].data['Wish'],
                              name:
                                  snapshot.data.documents[index].data['Name'],
                              nickName: snapshot
                                  .data.documents[index].data['NickName'],
                              audio: snapshot
                                  .data.documents[index].data['Audio'],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        color: Color.fromRGBO(242, 238, 237, 1),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/appimages/cardbackground.jpg',
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(height:width*0.05555),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage('assets/images/person/${snapshot.data.documents[index].data['Name']}.jpeg'),
                                    radius: width*0.138888,
//                                  backgroundColor: Colors.blue,
                                  ),
                                  SizedBox(
                                    height: width*0.02222,
                                  ),
                                  Text(
                                    snapshot
                                        .data.documents[index].data['NickName'],
                                    style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontSize: 20,
                                      fontFamily: 'DancingScript',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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
