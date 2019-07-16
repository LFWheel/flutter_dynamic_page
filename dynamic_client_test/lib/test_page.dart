import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
class DynamicPage extends StatelessWidget{
  Map<String,dynamic> data = {
    "goods":[{"name":"apple","price":"8990","img":"https://img.gedcc.org/uploads/product_img/155942/4a9ca45f-a407-4057-b4bc-945fa031d55e.jpeg-s400"},
    {"name":"orange","price":"890","img":"https://www.baidu.com/img/baidu_resultlogo@2.png"}]
  };
  String src = r'''
{"type":"Container","child":{"type":"ListView","dataSetExp":"data.goods","item":{"type":"Image","provider":"network","src":"data.img","width":200.0,"height":100.0,"fit":"contain"}}}
  ''';
  @override
  Widget build(BuildContext context) {
    DynamicWidgetBuilder builder = new DynamicWidgetBuilder();
    builder.withData(data);
    return SafeArea(
      child: Scaffold(
      body: builder.build(src)
    ),
    );
  }

}