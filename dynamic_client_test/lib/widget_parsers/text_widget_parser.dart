import 'package:flutter/material.dart';
import 'dynamic_widget.dart';
import 'package:dynamic_client_test/utils.dart';
class TextWidgetParser extends WidgetParser{
  @override
  Widget parse(Map<String, dynamic> map) {
    String data = map['data'];
    String textAlignString = map['textAlign'];
    String overflow = map['overflow'];
    int maxLines = map['maxLines'] == null ? 1 : map['maxLines'];
    String semanticsLabel = map['semanticsLabel'];
    bool softWrap = map['softWrap'];
    String textDirectionString = map['textDirection'];
    double textScaleFactor = map['textScaleFactor'];
    String parsedData = parseData(data);
    return Text(
        parsedData,
        textAlign: parseTextAlign(textAlignString),
        overflow: parseTextOverflow(overflow),
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        textDirection: parseTextDirection(textDirectionString),
        style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
        textScaleFactor: textScaleFactor,
      );
  }

}