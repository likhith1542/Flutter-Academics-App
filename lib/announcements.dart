import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitap/colorloader.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Notifications',
      home: new MyAnnouncementsPage(title: 'Notifications'),
    );
  }
}

class MyAnnouncementsPage extends StatefulWidget {
  MyAnnouncementsPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyAnnouncementsPageState createState() => _MyAnnouncementsPageState();
}

class _MyAnnouncementsPageState extends State<MyAnnouncementsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
        backgroundColor: Colors.lightBlueAccent[50],
      ),
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var c = LinearGradient(
      colors: [Colors.blue, Colors.lightBlueAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  var d = LinearGradient(
      colors: [Colors.pink, Colors.redAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn =
        await firestore.collection('announcements').getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: ColorLoader3(
                radius: 20.0,
                dotRadius: 5.0,
              ));
            } else {
              final int messageCount = snapshot.data.length;
              return Column(
                children: <Widget>[

                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(16.0),
                        itemCount: messageCount,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              gradient: (index % 2 == 0) ? c : d,
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              dense: true,
                              title: Text(
                                snapshot.data[index].data['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: "Montserrat Medium",
                                ),
                              ),
                              subtitle: Text(
                                '\n' +
                                    'Venue: '+snapshot.data[index].data['Venue'] +
                                    ' \n\n' +
                                    'Time: '+snapshot.data[index].data['timeanddate'] +
                                    '      ' +
                                    'Capacity: '+snapshot.data[index].data['Capacity'],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              );
            }
          }),
    );
  }
}
