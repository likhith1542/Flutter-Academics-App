import 'package:flutter/material.dart';

import 'cgpa.dart';
import 'gpa.dart';



class Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              labelStyle: TextStyle(
                fontFamily: "Montserrat Medium",
                fontSize: 16
              ),
              tabs: [
                Tab(
                  text: 'GPA',
                ),
                Tab(
                  text: 'CGPA',
                ),
              ],
            ),
            title: Text('Grades'),
            centerTitle: true,
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: TabBarView(
            children: [
              GPA(),
              CGPA(),
            ],
          ),
        ),
      ),
    );
  }
}
