import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:vitap/colorloader.dart';

class VTOP extends StatelessWidget {
  final String title;

  VTOP({
    @required this.title,
  });
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://vtop2.vitap.ac.in:8070/vtop/",
      withJavascript: true,
      withZoom: true,
      hidden: false,
      withLocalStorage: true,
      enableAppScheme: true,
        appBar: AppBar(
          title: Text(title),
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
          )
        ),
    );
  }
}