import 'package:dynamic_client_test/widget_parsers/image_widget_parser.dart';
import 'package:dynamic_client_test/widget_parsers/listview_widget_parser.dart';
import 'package:flutter/material.dart';
import 'column_row_widget_parser.dart';
import 'container_widget_parser.dart';
import 'text_widget_parser.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
class DynamicWidgetBuilder{
  static final Logger log = Logger('DynamicWidget');
  Map<String,dynamic> data;
  void withData(Map<String,dynamic> data){
    this.data = data;
  }
  static final _parsers = {
    "Container":ContainerWidgetParser(),
    "Text":TextWidgetParser(),
    "Image":ImageWidgetParser(),
    "ListView":ListViewWidgetParser(),
    "Column":ColumnWidgetParser(),
    "Row":RowWidgetParser()
  };
  
  Widget build(String json) {
    var map = jsonDecode(json);
    var widget = buildFromMap(map);
    return widget;
  }

   Widget buildFromMap(Map<String, dynamic> map,) {
    String widgetName = map['type'];
    WidgetParser parser = _parsers[widgetName];
    if(null!=parser){
      parser.withData(data);
      return parser.parse(map);
    }

    log.warning("Not support type: $widgetName");
    return null;
  }
  List<Widget> buildWidgets(
      List<dynamic> values) {
    List<Widget> rt = [];
    for (var value in values) {
      rt.add(buildFromMap(value));
    }
    return rt;
  }
}
abstract class WidgetParser {
  Map<String,dynamic> data;
  WidgetParser();
  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map);

  void withData(Map<String,dynamic> data){
    this.data = data;
  }
  
  //eg : data.goods[0].specs[0].name => data['goods'][0]['specs'][0]['name']
  dynamic parseData(String dataStr){
    if(data == null || dataStr == null || !dataStr.startsWith("data.")){
      return dataStr;
    }
    List<String> paths = dataStr.split(".");//此时是这样的['data',‘goods[0]’,'specs[0]','name']
    List<String> pathsResult = [];//用来存这样的['goods','[0]','specs','[0]','name']
    for(int i = 0; i < paths.length; i++){
      if(i == 0 && 'data' == paths[i]){
        continue;
      }
      String currentPath = paths[i];
      int arrStartIndex = currentPath.indexOf('[');
      int arrEndIndex = currentPath.indexOf(']');
      if(arrStartIndex>=0 && arrEndIndex>=0){
        pathsResult.add(currentPath.substring(0,arrStartIndex));
        pathsResult.add(currentPath.substring(arrStartIndex,arrEndIndex+1));
      }else{
        pathsResult.add(currentPath);
      }
    }
    dynamic value = data;
    for(String path in pathsResult){
      print(path);
      if(path.indexOf('[')>=0){
        value = value[int.parse(path.substring(1,path.indexOf(']')))];
      }else{
        value = value[path];
      }
    }
    print(value);
    return value;
  }
}