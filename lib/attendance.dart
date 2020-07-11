import 'package:flutter/material.dart';
import './screens/note_list.dart';

class Attendance extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Attendance Tracker',
      debugShowCheckedModeBanner: false,
      home: NoteList(),
    );
  }
}

