import 'package:flutter/material.dart';
import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
class DynamicPage extends StatelessWidget{
  Map<String,dynamic> data = {
    "goods":[{"name":"apple","price":"8990","img":"https://img.gedcc.org/uploads/product_img/155942/4a9ca45f-a407-4057-b4bc-945fa031d55e.jpeg-s400"},
    {"name":"orange","price":"890","img":"https://www.baidu.com/img/baidu_resultlogo@2.png"}]
  };
  String src = r'''
{"type":"Container","child":{"type":"ListView","dataSetExp":"data.goods",
"item":{"type":"Row","mainAxisAlignment":"spaceAround","children":
[{"type":"Image","provider":"network","src":"data.img","width":90.0,"height":90.0,"fit":"fill"},
{"type":"Column",
"children":[{"type":"Text","data":"data.name"},{"type":"Text","data":"data.price"}]}]}}}
  ''';
  @override
  Widget build(BuildContext context) {
    DynamicWidgetBuilder builder = new DynamicWidgetBuilder();
    builder.withData(getData());
    return SafeArea(
      child: Scaffold(
      body: builder.build(src)
    ),
    );
  }

  Map<String,dynamic> getData(){
    Map<String,dynamic> data = {};
    List<Map<String,dynamic>> goodsList = [];
    for(var i=0;i<12;i++){
      Map<String,String> goods = {};
      goods['name'] = "goods name $i";
      goods['img'] = "https://img.gedcc.org/uploads/product_img/155942/4a9ca45f-a407-4057-b4bc-945fa031d55e.jpeg-s400";
      goods['price'] = '¥12$i';
      goodsList.add(goods);
    }
    data['goods'] = goodsList;
    return data;
  }
}