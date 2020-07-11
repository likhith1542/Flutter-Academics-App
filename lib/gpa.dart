import 'package:flutter/material.dart';

class GPA extends StatefulWidget {
  GPA({Key key}) : super(key: key);

  @override
  _GPAState createState() => _GPAState();
}

class _GPAState extends State<GPA> {
  List<DropdownMenuItem<double>> clist = [];
  List<DropdownMenuItem<double>> glist = [];
  double inc = 0;
  double ing = 0;
  String _result = '';

  void gresult(){
    setState(() {
      _result='GPA = '+((c1*g1 + c2*g2 + c3*g3 + c4*g4 + c5*g5 + c6*g6 + c7*g7 + c8*g8 + c9*g9 + c10*g10)/(c1+c2+c3+c4+c5+c6+c7+c8+c9+c10)).toStringAsFixed(2);
    });
  }
  void loadData() {
    clist = [];
    glist = [];
    clist.add(new DropdownMenuItem(
      child: Text('4'),
      value: 4,
    ));
    clist.add(new DropdownMenuItem(
      child: Text('3'),
      value: 3,
    ));
    clist.add(new DropdownMenuItem(
      child: Text('2'),
      value: 2,
    ));
    clist.add(new DropdownMenuItem(
      child: Text('1'),
      value: 1,
    ));
    clist.add(new DropdownMenuItem(
      child: Text('0'),
      value: 0,
    ));

    glist.add(new DropdownMenuItem(
      child: Text('S'),
      value: 10,
    ));
    glist.add(new DropdownMenuItem(
      child: Text('A'),
      value: 9,
    ));
    glist.add(new DropdownMenuItem(
      child: Text('B'),
      value: 8,
    ));
    glist.add(new DropdownMenuItem(
      child: Text('C'),
      value: 7,
    ));
    glist.add(new DropdownMenuItem(
      child: Text('D'),
      value: 6,
    ));
    glist.add(new DropdownMenuItem(
      child: Text('E'),
      value: 5,
    ));
    glist.add(new DropdownMenuItem(
      child: Text('F'),
      value: 0,
    ));
  }

  double c1 = 0,
      c2 = 0,
      c3 = 0,
      c4 = 0,
      c5 = 0,
      c6 = 0,
      c7 = 0,
      c8 = 0,
      c9 = 0,
      c10 = 0;
  double g1 = 0,
      g2 = 0,
      g3 = 0,
      g4 = 0,
      g5 = 0,
      g6 = 0,
      g7 = 0,
      g8 = 0,
      g9 = 0,
      g10 = 0;
  final List<double> credits = [4, 3, 2, 1];
  @override
  Widget build(BuildContext context) {
    loadData();
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 15;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    _result,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Center(child: Text('Subject Credits')),
                      Center(child: Text('Subject Grade')),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c1,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c1 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g1,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g1 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c2,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c2 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g2,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g2 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c3,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c3 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g3,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g3 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c4,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c4 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g4,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g4 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c5,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c5 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g5,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g5 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c6,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c6 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g6,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g6 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c7,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c7 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g7,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g7 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c8,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c8 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g8,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g8 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c9,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c9 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g9,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g9 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Credits'),
                          value: c10,
                          items: clist,
                          onChanged: (value) {
                            setState(() {
                              c10 = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text('Grades'),
                          value: g10,
                          items: glist,
                          onChanged: (value) {
                            setState(() {
                              g10 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    gresult();
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
