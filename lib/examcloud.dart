import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:vitap/colorloader.dart';

class EC extends StatelessWidget {

  
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.examcloud.in/epn/slogin.php",
      withJavascript: true,
      withZoom: true,
      hidden: false,
      withLocalStorage: true,
      enableAppScheme: true,
      appBar: AppBar(
        title: Text('ExamCloud'),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      initialChild: Container(
        color: Colors.white,
        child: Center(
            child: ColorLoader3(
              radius: 20.0,
              dotRadius: 5.0,
            )
          )),
    );
  }
}