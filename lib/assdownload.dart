import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitap/colorloader.dart';

class AssignmentDownload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faculty',
      home: new MyAssignmentDownloadPage(),
    );
  }
}

class MyAssignmentDownloadPage extends StatefulWidget {
  @override
  _MyFacultyPageState createState() => _MyFacultyPageState();
}

class _MyFacultyPageState extends State<MyAssignmentDownloadPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        await firestore.collection('assignmentsurl').getDocuments();
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
                  Padding(
                      padding: const EdgeInsets.only(top: 5, left: 55.0),
                      child: Row(
                        children: <Widget>[
                          Text('*', style: TextStyle(color: Colors.red)),
                          Text('This Section will reset every week'),
                        ],
                      )),
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
                                snapshot.data[index].data['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Montserrat Medium",
                                ),
                              ),
                              onTap: () {
                                var urlll = snapshot.data[index].data['url'];
                                _launchURL(urlll);
                              },
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

_launchURL(urldurl) async {
  var url = urldurl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
