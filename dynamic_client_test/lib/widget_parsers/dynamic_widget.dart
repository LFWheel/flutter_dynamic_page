import 'package:flutter/material.dart';
abstract class WidgetParser {
  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map);

  /// check the matched widget type. for example:
  /// {"type" : "Text", "data" : "Denny"}
  /// if you want to make a flutter Text widget, you should implement this
  /// method as "Text" == widgetName, for more details, please see
  /// @TextWidgetParser
  bool forWidget(String widgetName);
}