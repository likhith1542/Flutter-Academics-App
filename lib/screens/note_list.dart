import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/note.dart';
import '../utils/database_helper.dart';
import '../screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/selections.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  var c = LinearGradient(
      colors: [Colors.blue, Colors.lightBlueAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  var d = LinearGradient(
      colors: [Colors.pink, Colors.redAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  double reqPercentage = 80;
  double newPercent = 0;
  final date = DateTime.now();

  _changed() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble('percent', newPercent);
    });
    _save();
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      reqPercentage = prefs.getDouble('percent');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Attendace Tracker',
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Selections.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text('To delete asubject Long Press on Subject Name'),
          ),
          Expanded(child: getNoteListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          navigateToDetail(Note('', '', 0, 0), 'Add Subject', reqPercentage);
        },
        tooltip: 'Add Subject',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    if (reqPercentage == null) {
      reqPercentage = 0;
      //_percentDialog();
    }
    return ListView.builder(
      
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        int total = this.noteList[position].total;
        int present =
            this.noteList[position].total - this.noteList[position].missed;
        // ignore: unused_local_variable
        double percent = ((present / total) * 100);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              gradient: position%2==0 ? c:d
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: ListTile(
                    title: Text(
                      this.noteList[position].title,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: "Montserrat Medium"),
                    ),
                    subtitle: Text(
                      'Attendance: $present/$total',
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Montserrat Medium"),
                    ),
                    trailing: animatedCircularChart(total, present),
                    onLongPress: () {
                      setState(() {
                        databaseHelper.deleteNote(noteList[position].id);
                        updateListView();
                      });
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Total Classes:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Montserrat Medium"),
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.plusCircle),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    this.noteList[position].total =
                                        this.noteList[position].total + 1;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.minusCircle),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    int c = this.noteList[position].missed + 1;
                                    if (this.noteList[position].total >= c) {
                                      this.noteList[position].total =
                                          this.noteList[position].total - 1;
                                    } else {
                                      this.noteList[position].total =
                                          this.noteList[position].total - 1;
                                    }
                                    // this.noteList[position].total =
                                    //     this.noteList[position].total - 1;
                                    // this.noteList[position].missed=this.noteList[position].missed+1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Absent Classes:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Montserrat Medium"),
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.plusCircle),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    // if (this.noteList[position].missed > 0) {
                                    //   this.noteList[position].missed =
                                    //       this.noteList[position].missed + 1;
                                    // } else {
                                    this.noteList[position].missed =
                                        this.noteList[position].missed + 1;
                                    this.noteList[position].total =
                                        this.noteList[position].total + 1;
                                    // }
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.minusCircle),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    this.noteList[position].missed =
                                        this.noteList[position].missed - 1;
                                    // this.noteList[position].missed=this.noteList[position].missed+1;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 10,
                  ),
                  child: numberOfLecturesRequired(total, present) > 0
                      ? Text(
                          'You have to attend ${numberOfLecturesRequired(total, present)} classes',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      : Text(
                          'You can bunk upto ${numberOfLecturesRequired(total, present) * (-1)} classes',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int numberOfLecturesRequired(int total, int present) {
    int a = 0;
    int x;
    if (reqPercentage == 100)
      x = a;
    else
      x = (((reqPercentage * 0.01) * total - present) /
              ((100 - reqPercentage) * 0.01))
          .ceil();
    int bunks = 0;
    int t = total + 1;
    if (x < 0) {
      while (x < 0) {
        x = (((reqPercentage * 0.01) * t - present) /
                ((100 - reqPercentage) * 0.01))
            .ceil();
        if (x <= 0) bunks++;
        t++;
      }
      return bunks * -1;
    }
    return x;
  }

  void navigateToDetail(Note note, String title, double reqPercentage) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title, reqPercentage);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void deleteListViewItem() {}

  void deleteListView() {
    databaseHelper.deleteAll();
    noteList = [];
    updateListView();
    Navigator.of(context, rootNavigator: true).pop();
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.reqPercentage = reqPercentage;
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  Widget animatedCircularChart(int total, int present) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    final _chartSize = const Size(80, 80);
    int print;
    if (total == 0)
      print = 0;
    else
      print = ((present / total) * 100).ceil();
    return new AnimatedCircularChart(
      key: _chartKey,
      size: _chartSize,
      initialChartData: <CircularStackEntry>[
        total == 0
            ? new CircularStackEntry(<CircularSegmentEntry>[
                new CircularSegmentEntry(100, Colors.white)
              ])
            : new CircularStackEntry(
                <CircularSegmentEntry>[
                  new CircularSegmentEntry(
                    (present / total) * 100,
                    ((present / total) * 100) >= reqPercentage
                        ? Colors.white
                        : Colors.red,
                    rankKey: 'completed',
                  ),
                  // new CircularSegmentEntry(
                  //   (1 - (present / total)) * 100,
                  //   Colors.lightBlueAccent,
                  //   rankKey: 'remaining',
                  // ),
                ],
                rankKey: 'progress',
              ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '$print%',
      labelStyle: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  var text = new RichText(
    text: new TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        new TextSpan(text: 'Hello'),
        new TextSpan(
            text: '', style: new TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );

  void choiceAction(String choice) {
    if (choice == Selections.delete) {
      if (noteList.isNotEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("DELETE ALL"),
                content: Text('ARE YOU SURE YOU WANT TO DELETE ALL ENTRIES?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Close'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  FlatButton(
                    child: Text('Accept'),
                    onPressed: deleteListView,
                  )
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('List already Empty'),
                content: Text('No subjects to delete'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Close'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            });
      }
    } else if (choice == Selections.add) {
      navigateToDetail(Note('', '', 0, 0), 'Add Subject', reqPercentage);
    } else if (choice == Selections.edit) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Minimum attendace needed\nCurrent: $reqPercentage'),
            content: TextField(
              decoration: InputDecoration(
                hintText: '$reqPercentage',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                newPercent = double.parse(value);
                _changed();
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Save'),
                onPressed: newPercent != null
                    ? () {
                        setState(() {
                          reqPercentage = newPercent;
                          _save();
                          updateListView();
                        });
                        Navigator.of(context).pop();
                      }
                    : null,
              )
            ],
          );
        },
      );
    }
  }
}
