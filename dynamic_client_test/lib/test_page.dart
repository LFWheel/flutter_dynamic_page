import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
class DynamicPage extends StatelessWidget{
  Map<String,dynamic> data = {
    "goods":[{"name":"apple","price":"8990"},{"name":"orange","price":"890"}]
  };
  String src = r'''
{"type":"Container","color":"ffFFFF00","height":200.0,"width":200.0,"margin":"20,20,20,20",
"child":{"type":"Text","data":"testpagetestpagetestpagetestpage","textAlign":"center",
"textDirection":"rtl","overflow":"ellipsis","textScaleFactor":0.9,"softWrap":false,"maxLines":1,
"semanticsLabel":"www",
"style":{"color":"ffefe6e6","fontWeight":"bold","fontSize":33.0}}}
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