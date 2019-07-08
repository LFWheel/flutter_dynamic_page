import 'package:flutter/material.dart';
import 'container_widget_parser.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
class DynamicWidgetBuilder{
  static final Logger log = Logger('DynamicWidget');
  Map<String,dynamic> data;
  void withData(Map<String,dynamic> data){
    this.data = data;
  }
  static final _parsers = {
    "Container":ContainerWidgetParser()
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
}
abstract class WidgetParser {
  Map<String,dynamic> data;
  WidgetParser();
  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map);

  void withData(Map<String,dynamic> data){
    this.data = data;
  }
  
}