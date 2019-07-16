import 'package:dynamic_client_test/widget_parsers/dynamic_widget.dart';
import 'package:dynamic_client_test/utils.dart';
import 'package:flutter/widgets.dart';

class ImageWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map) {
    String src = map['src'];
    String provider = map['provider'];
    double width = (map['width'] == null) ? 0 : map['width'];
    double height = (map['height'] == null) ? 0 : map['height'];
    ImageRepeat repeat = map.containsKey('repeat')
        ? parseImageRepeat(map['repeat'])
        : ImageRepeat.noRepeat;
    Widget widget;
    if ('network' == provider) {
      print("ImageWidgetParser src:"+parseData(src));
      widget = Image.network(parseData(src),width: width,height: height,fit: parseBoxFit(map['fit']),
      alignment: parseAlignment(map['alignment']),repeat: repeat,);
    } else if ('asset' == provider) {
      widget = Image.asset(parseData(src),width: width,height: height,fit: parseBoxFit(map['fit']),
      alignment: parseAlignment(map['alignment']),repeat: repeat,);
    }
    return widget;
  }
}
