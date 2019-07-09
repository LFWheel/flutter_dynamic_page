import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
class DynamicPage extends StatelessWidget{
  Map<String,dynamic> data = {
    "goods":[{"name":"apple","price":"8990"},{"name":"orange","price":"890"}]
  };
  String src = r'''
{"type":"Container","alignment":"topLeft","color":"#e4e4e4","width":200.0,"height":200.0,"margin":"12.0,8.0,12.0,0.0","child":{"type":"Text","data":"data.goods[0].name"}}
  ''';
  @override
  Widget build(BuildContext context) {
    DynamicWidgetBuilder builder = new DynamicWidgetBuilder();
    builder.withData(data);
    return SafeArea(
      child: Scaffold(
      body: builder.build(src),
    ),
    );
  }

}