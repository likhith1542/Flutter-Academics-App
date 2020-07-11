import 'package:flutter/material.dart';
import 'package:vitap/assdownload.dart';
import 'package:vitap/assupload.dart';




class Assignments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,onPressed: (){
              Navigator.of(context).pop();
            }),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              labelStyle: TextStyle(
                fontFamily: "Montserrat Medium",
                fontSize: 16
              ),
              tabs: [
                Tab(
                  text: 'Upload',
                ),
                Tab(
                  text: 'Download',
                ),
              ],
            ),
            title: Text('Assignments'),
            centerTitle: true,
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: TabBarView(
            children: [
              Assignmentsupload(),
              AssignmentDownload(),
            ],
          ),
        ),
      ),
    );
  }
}
