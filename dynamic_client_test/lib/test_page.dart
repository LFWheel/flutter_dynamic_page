import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
class DynamicPage extends StatelessWidget{
  Map<String,dynamic> data = {
    "goods":[{"name":"apple","price":"8990"},{"name":"orange","price":"890"}]
  };
  String src = r'''
{"type":"Container","child":{"type":"ListView","dataSetExp":"data.goods",
"item":{"type":"Container","child":{"type":"Text","data":"data.name"}}}}
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