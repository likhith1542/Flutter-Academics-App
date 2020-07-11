import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CGPA extends StatefulWidget {
  CGPA({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CGPAState createState() => new _CGPAState();
}

//globalkey
//email, password variable
//form
//textformfield
//submit

class _CGPAState extends State<CGPA> {
  final formKey = GlobalKey<FormState>();
  String g1, g2, g3, g4, g5, g6, g7, g8, g9, g10;
  String c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;
  double g11, g12, g13, g14, g15, g16, g17, g18, g19, g20;
  double c11, c12, c13, c14, c15, c16, c17, c18, c19, c20;
  String cgparesult = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: GridView.count(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 6),
                crossAxisSpacing: 10,
                primary: false,
                crossAxisCount: 2,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Sem Credits',
                    ),
                  ),
                  Center(
                    child: Text(
                      'CGPA',
                    ),
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c1 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g1 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c2 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g2 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c3 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g3 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c4 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g4 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c5 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g5 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c6 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g6 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c7 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g7 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (input) => c8 = input,
                  ),
                  TextFormField(
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSaved: (input) => g8 = input,
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cgparesult,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: _submit,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ],
    ));
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      if (c1 != null) {
        c11 = double.tryParse(c1);
      } else {
        c11 = 0;
      }

      if (c2 != null) {
        c12 = double.tryParse(c2);
      } else {
        c12 = 0;
      }

      if (c3 != null) {
        c13 = double.tryParse(c3);
      } else {
        c13 = 0;
      }

      if (c4 != null) {
        c14 = double.tryParse(c4);
      } else {
        c14 = 0;
      }

      if (c5 != null) {
        c15 = double.tryParse(c5);
      } else {
        c15 = 0;
      }

      if (c6 != null) {
        c16 = double.tryParse(c6);
      } else {
        c16 = 0;
      }

      if (c7 != null) {
        c17 = double.tryParse(c7);
      } else {
        c17 = 0;
      }

      if (c8 != null) {
        c18 = double.tryParse(c8);
      } else {
        c18 = 0;
      }

      if (c9 != null) {
        c19 = double.tryParse(c9);
      } else {
        c19 = 0;
      }

      if (c10 != null) {
        c20 = double.tryParse(c10);
      } else {
        c20 = 0;
      }

      if (g1 != null) {
        g11 = double.tryParse(g1);
      } else {
        g11 = 0;
      }

      if (g2 != null) {
        g12 = double.tryParse(g2);
      } else {
        g12 = 0;
      }

      if (g3 != null) {
        g13 = double.tryParse(g3);
      } else {
        g13 = 0;
      }

      if (g4 != null) {
        g14 = double.tryParse(g4);
      } else {
        g14 = 0;
      }

      if (g5 != null) {
        g15 = double.tryParse(g5);
      } else {
        g15 = 0;
      }

      if (g6 != null) {
        g16 = double.tryParse(g6);
      } else {
        g16 = 0;
      }

      if (g7 != null) {
        g17 = double.tryParse(g7);
      } else {
        g17 = 0;
      }

      if (g8 != null) {
        g18 = double.tryParse(g8);
      } else {
        g18 = 0;
      }

      if (g9 != null) {
        g19 = double.tryParse(g9);
      } else {
        g19 = 0;
      }

      if (g10 != null) {
        g20 = double.tryParse(g10);
      } else {
        g20 = 0;
      }
    }
    setState(() {
      cgparesult = 'CGPA = ' +
          ((c11 * g11 +
                      c12 * g12 +
                      c13 * g13 +
                      c14 * g14 +
                      c15 * g15 +
                      c16 * g16 +
                      c17 * g17 +
                      c18 * g18 +
                      c19 * g19 +
                      c20 * g20) /
                  (c11 + c12 + c13 + c14 + c15 + c16 + c17 + c18 + c19 + c20))
              .toStringAsFixed(2);
    });
  }
}
