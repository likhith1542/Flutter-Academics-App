import 'package:flutter/material.dart';
import '../models/note.dart';
import '../utils/database_helper.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;
  final double reqPercentage;

  NoteDetail(this.note, this.appBarTitle,this.reqPercentage);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle,this.reqPercentage);
  }
}

class NoteDetailState extends State<NoteDetail> {

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;
  double reqPercentage;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool _validate = false;

  NoteDetailState(this.note, this.appBarTitle,this.reqPercentage);
  Widget animatedCircularChart(int total, int present) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    int print;
    final _chartSize = const Size(150, 150);
    if(total>0)
      print = ((present / total) * 100).ceil();
    else
      print = 0;
    return new AnimatedCircularChart(
      key: _chartKey,
      size: _chartSize,
      initialChartData: <CircularStackEntry>[
        total==0 ? new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(100, Colors.white)
          ]
          ) :
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              (present / total) * 100,
              ((present / total)*100)>=reqPercentage ? Colors.green : Colors.red,
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              (1 - (present / total)) * 100,
              Colors.white,
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '$print',
      labelStyle: new TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
  /*void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }*/

  @override
  Widget build(BuildContext context) {
    //TextStyle textStyle = Theme.of(context).textTheme.title;
    titleController.text = note.title;

    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      _validate = value.length == 0;
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelText: 'Subject',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                // Save and Delete
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.lightBlueAccent,
                          textColor: Colors.white,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Update the title of Note object
  void updateTitle() {
    note.title = titleController.text;
  }


  // Save data to database
  void _save() async {
    moveToLastScreen();
    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Attendance updated successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Attendance');
    }
  }


  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
