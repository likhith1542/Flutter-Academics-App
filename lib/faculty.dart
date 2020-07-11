import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitap/colorloader.dart';

class Faculty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Faculty',
      home: new MyFacultyPage(title: 'Faculty'),
    );
  }
}

class MyFacultyPage extends StatefulWidget {
  MyFacultyPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyFacultyPageState createState() => _MyFacultyPageState();
}

class _MyFacultyPageState extends State<MyFacultyPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
        backgroundColor: Colors.lightBlueAccent[50],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
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
        await firestore.collection('faculty').orderBy('branch').getDocuments();

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
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Enter Faculty Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                      onChanged: (string) {
                        
                      },
                    ),
                  ),
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
                                snapshot.data[index].data['Name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: "Montserrat Medium",
                                ),
                              ),
                              subtitle: Text(
                                '\n' +
                                    snapshot.data[index].data['branch'] +
                                    '  ' +
                                    snapshot.data[index].data['block'] +
                                    ' ' +
                                    snapshot.data[index].data['room'],
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
