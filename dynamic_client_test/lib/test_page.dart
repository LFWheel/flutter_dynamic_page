import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
class DynamicPage extends StatelessWidget{
  String src = r'''
{"type":"Container","alignment":"topLeft","color":"#000000","width":200.0,"height":200.0,"margin":"12.0,8.0,12.0,0.0","child":{"type":"Text","text":"data.text.titles[0]"}}
  ''';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DynamicWidgetBuilder().build(src),
    );
  }

}